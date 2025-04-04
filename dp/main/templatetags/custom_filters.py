from django import template

register = template.Library()

@register.filter
def multiply(value, arg):
    """
    Умножава стойността value по аргумента arg.
    """
    try:
        return float(value) * float(arg)
    except (TypeError, ValueError):
        return None  # Ако стойностите са невалидни, връщаме None
