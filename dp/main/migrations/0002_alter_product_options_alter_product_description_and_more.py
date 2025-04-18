# Generated by Django 4.2.20 on 2025-04-01 17:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='product',
            options={'verbose_name': 'Артикул', 'verbose_name_plural': 'Артикули'},
        ),
        migrations.AlterField(
            model_name='product',
            name='description',
            field=models.TextField(blank=True, default='', verbose_name='Описание'),
        ),
        migrations.AlterField(
            model_name='product',
            name='group',
            field=models.PositiveSmallIntegerField(choices=[(1, 'Мъжки и дамски дрехи'), (2, 'Електроника'), (3, 'Бижута')], default=1, verbose_name='Продуктова група'),
        ),
        migrations.AlterField(
            model_name='product',
            name='name',
            field=models.CharField(max_length=40, verbose_name='Наименование'),
        ),
        migrations.AlterField(
            model_name='product',
            name='price',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=10, verbose_name='Цена'),
        ),
        migrations.AlterField(
            model_name='product',
            name='product_image',
            field=models.ImageField(blank=True, null=True, upload_to='product_image', verbose_name='Снимка'),
        ),
    ]
