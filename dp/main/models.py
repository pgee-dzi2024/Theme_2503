from django.db import models
from django.contrib.auth.models import User
from uuid import uuid4  # За уникален идентификатор на анонимни колички

GROUP1 = 1
GROUP2 = 2
GROUP3 = 3
PRODUCT_TYPE = [
    (GROUP1, 'Мъжки и дамски дрехи'),
    (GROUP2, 'Електроника'),
    (GROUP3, 'Бижута'),
]


class Product(models.Model):
    name = models.CharField('Наименование', max_length=40)
    group = models.PositiveSmallIntegerField('Продуктова група', choices=PRODUCT_TYPE, default=GROUP1)
    product_image = models.ImageField('Снимка', upload_to='product_image', null=True, blank=True)
    price = models.DecimalField('Цена', max_digits=10, decimal_places=2, default=0.00)
    description = models.TextField('Описание', default='', blank=True, )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Артикул'
        verbose_name_plural = 'Артикули'


class Cart(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)  # Ако потребителят е логнат
    session_id = models.CharField(max_length=36, null=True, blank=True)  # За анонимен потребител (уникален ключ)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def get_total(self):
        """
        Изчислява общата сума на количката.
        """
        total = sum(item.get_subtotal() for item in self.items.all())
        return total

    def get_total_formatted(self):
        """
        Returns total as a formatted string with 2 decimal places
        """
        return f"{self.get_total():.2f}"

    def __str__(self):
        if self.user:
            return f"Cart for {self.user.username}"
        else:
            return f"Cart for session {self.session_id}"

    class Meta:
        verbose_name = 'Количка'
        verbose_name_plural = 'Колички'


class CartItem(models.Model):
    cart = models.ForeignKey(Cart, related_name='items', on_delete=models.CASCADE)  # Връзка с количката
    product = models.ForeignKey(Product, on_delete=models.CASCADE)  # Връзка с продукта
    quantity = models.PositiveIntegerField(default=1)  # Брой на продукта в количката

    def get_subtotal(self):
        """
        Изчислява междинната сума за текущия продукт.
        """
        return self.product.price * self.quantity

    def get_subtotal_formatted(self):
        """
        Изчислява междинната стойност като форматиран низ с два знака
        """
        return f"{self.get_subtotal():.2f}"

    def __str__(self):
        return f"{self.product.name} - {self.quantity}"

    class Meta:
        verbose_name = 'Позиция в количката'
        verbose_name_plural = 'Позиции в количката'


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    # Полета за потребителски данни
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField()
    phone = models.CharField(max_length=20)
    address = models.TextField()
    notes = models.TextField(blank=True, default='')

    def __str__(self):
        return f"Order {self.id} by {self.user}" if self.user else f"Order {self.id} (Anonymous)"


class OrderItem(models.Model):
    order = models.ForeignKey(Order, related_name="items", on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()

    def __str__(self):
        return f"{self.product.name} - {self.quantity}"

    def get_total(self):
        return self.product.price * self.quantity