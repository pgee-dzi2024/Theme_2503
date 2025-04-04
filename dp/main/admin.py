from django.contrib import admin
from .models import *


@admin.register(Product)
class QuestionV(admin.ModelAdmin):
    list_display = ('id', 'name', 'group', 'price', )
    list_display_links = ('id', 'name',)
    list_filter = ('group', )
    ordering = ('-id', )


@admin.register(Cart)
class CartAdmin(admin.ModelAdmin):
    list_display = ('user', 'created_at', 'updated_at')


@admin.register(CartItem)
class CartItemAdmin(admin.ModelAdmin):
    list_display = ('cart', 'product', 'quantity')