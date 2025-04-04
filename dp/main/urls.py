from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', home_view, name='home'),  # Начална страница
    path('add-to-cart/<int:pk>/', add_to_cart_view, name='add-to-cart'),  # Добавяне в количка
    path('cart/', cart_view, name='cart'),  # Страница на количката
    path('cart/clear/', clear_cart_view, name='clear_cart'),  # Изчистване на количката
    path('checkout/step-one/', checkout_step_one, name='checkout_step_one'),
    path('checkout/step-two/', checkout_step_two, name='checkout_step_two'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
