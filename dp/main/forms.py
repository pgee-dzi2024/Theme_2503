from django import forms
from .models import Order


class OrderForm(forms.ModelForm):
    """
    ModelForm за събиране на информация за потребителя и адреса.
    """

    class Meta:
        model = Order
        fields = ['first_name', 'last_name', 'email', 'phone', 'address']
        widgets = {
            'address': forms.Textarea(attrs={'rows': 3}),
        }

        # Добавяне на метод за валидация на имейл

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if not email.endswith('@example.com'):  # Примерна валидация
            raise forms.ValidationError("Имейлът трябва да бъде в домейна example.com")
        return email


class NotesForm(forms.Form):
    """
    Form за допълнителни данни (бележки).
    """
    notes = forms.CharField(
        label="Бележки към поръчката",
        widget=forms.Textarea(attrs={'rows': 3}),
        max_length=500,
        required=False
    )

    # Пример за потребителска валидация
    def clean_notes(self):
        notes = self.cleaned_data.get('notes')
        if len(notes) > 500:
            raise forms.ValidationError("Бележките не могат да съдържат повече от 500 символа")
        return notes