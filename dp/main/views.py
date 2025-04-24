from django.shortcuts import render, redirect, reverse, get_object_or_404
from . import forms, models
from django.http import HttpResponseRedirect, HttpResponse
from django.core.mail import send_mail
from django.contrib.auth.models import Group
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib import messages
from django.conf import settings


# Извлича количката за регистриран потребител или анонимен
def get_or_create_cart(request):
    if request.user.is_authenticated:
        # Ако потребителят е логнат, търсим количка по user
        cart, created = models.Cart.objects.get_or_create(user=request.user)
    else:
        # Ако потребителят е анонимен, ползваме session_id
        session_id = request.session.session_key or request.session.create()
        cart, created = models.Cart.objects.get_or_create(session_id=session_id)
    return cart


# Помощна функция за генериране на контекст
def get_products_by_group():
    def products_by_group(group_value):
        # Извличане на всички продукти за дадената група
        products = models.Product.objects.filter(group=group_value)

        # Разделяне на продуктите на подсписъци с максимум 3 елемента в списък
        grouped_products = [list(products[i:i + 3]) for i in range(0, len(products), 3)]

        return grouped_products
    products_g1 = products_by_group(models.GROUP1)
    products_g2 = products_by_group(models.GROUP2)
    products_g3 = products_by_group(models.GROUP3)
    context = {'products_g1': products_g1,
               'products_g2': products_g2,
               'products_g3': products_g3,
               'product_count_in_cart': 0,
               }

    return context


# Начален изглед при стартиране на приложението
def home_view(request):
    context = get_products_by_group()
    cart = get_or_create_cart(request)  # Получаваме количката
    context['product_count_in_cart'] = cart.items.count()  # Общ брой артикули в количката

    return render(request, 'main/index.html', context)


# Добавяне на продукт към количката
def add_to_cart_view(request, pk):
    product = get_object_or_404(models.Product, pk=pk)  # Проверка дали продуктът съществува
    cart = get_or_create_cart(request)  # Вземаме количката

    # Пробваме да добавим продукта в количката или увеличаваме количеството, ако вече е там
    cart_item, created = models.CartItem.objects.get_or_create(cart=cart, product=product)
    if not created:
        cart_item.quantity += 1
        cart_item.save()

    messages.info(request, f"{product.name} беше добавен в количката!")
    return redirect('home')  # Пренасочване към началната страница


# Показва съдържанието на количката
def cart_view(request):
    cart = get_or_create_cart(request)  # Вземаме количката
    items = cart.items.all()  # Всички продукти в количката
    total = cart.get_total()  # Изчисляваме общата сума

    context = {
        'cart': cart,
        'items': items,
        'total': total,
    }
    return render(request, 'main/cart.html', context)


# Изчиства количката
def clear_cart_view(request):
    cart = get_or_create_cart(request)  # Вземаме количката
    cart.items.all().delete() # Изтриваме всички елементи от количката
    messages.info(request, "Количката беше изчистена!")
    return redirect('cart')  # Пренасочваме към страницата с количката


def checkout_step_one(request):
    """
    Първа стъпка: Попълване на данни за поръчка
    """
    cart = models.Cart.objects.filter(user=request.user).first()  # Получаваме количката на потребителя
    if not cart or not cart.items.exists():
        messages.error(request, "Количката е празна!")
        return redirect('cart')

    if request.method == 'POST':
        form = forms.OrderForm(request.POST)
        if form.is_valid():
            # Запазваме данните временно в сесията
            request.session['order_data'] = form.cleaned_data  # Съхраняваме полетата от формата
            return redirect('checkout_step_two')  # Към следващата стъпка
    else:
        form = forms.OrderForm()

    return render(request, 'main/checkout_step_one.html', {'form': form})


def checkout_step_two(request):
    """
    Втора стъпка: Добавяне на бележки и финализиране
    """
    order_data = request.session.get('order_data')  # Извличаме данните от предходната стъпка
    if not order_data:
        return redirect('checkout_step_one')  # Ако няма данни, връщаме се към 1-ва стъпка

    cart = models.Cart.objects.filter(user=request.user).first()

    if request.method == 'POST':
        form = forms.NotesForm(request.POST)
        if form.is_valid():
            # Създаваме поръчка в базата данни
            order = models.Order.objects.create(
                user=request.user if request.user.is_authenticated else None,
                **order_data,
                notes=form.cleaned_data['notes']
            )
            # Добавяме продуктите към поръчката
            for item in cart.items.all():
                models.OrderItem.objects.create(
                    order=order,
                    product=item.product,
                    quantity=item.quantity
                )
            cart.items.all().delete()  # Изчистваме количката
            messages.success(request, "Вашата поръчка беше завършена успешно!")
            return redirect('home')
    else:
        form = forms.NotesForm()

    return render(request, 'main/checkout_step_two.html', {'form': form, 'cart': cart})


def update_cart(request, product_id):
    cart = models.Cart.objects.get(user=request.user)
    product = get_object_or_404(models.Product, id=product_id)
    item = get_object_or_404(models.CartItem, cart=cart, product=product)
    if request.method == 'POST':
        form = forms.UpdateQuantityForm(request.POST)
        if form.is_valid():
            quantity = form.cleaned_data['quantity']
            item.quantity = quantity
            item.save()
            messages.success(request, f'Продуктът {item.product.name} е обновен.')
        else:
            messages.error(request, 'Грешка при обновяване на количеството.')
    return redirect('cart')


def remove_from_cart(request, product_id):
    cart = models.Cart.objects.get(user=request.user)
    product = get_object_or_404(models.Product, id=product_id)
    item = get_object_or_404(models.CartItem, cart=cart, product=product)
    if request.method == 'POST':
        form = forms.RemoveFromCartForm(request.POST)
        if form.is_valid():
            item.delete()
            messages.success(request, f'Продуктът {product.name} беше премахнат от количката.')
    return redirect('cart')
