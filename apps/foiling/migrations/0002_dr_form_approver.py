# Generated by Django 3.1.4 on 2021-01-22 12:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('foiling', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='dr_form',
            name='approver',
            field=models.CharField(choices=[('JOSIE AUTOS', 'JOSIE AUTOS'), ('GLORIA PASTOR', 'GLORIA PASTOR')], default='', max_length=50),
        ),
    ]
