# Generated by Django 3.1.4 on 2021-01-19 06:15

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='dr_form',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_created', models.DateField(default=django.utils.timezone.now)),
                ('control_no', models.IntegerField(unique=True)),
                ('customer', models.CharField(choices=[('HONDA', 'HONDA'), ('IMV', 'IMV'), ('GM', 'GM'), ('OUTLANDER', 'OUTLANDER'), ('CHRYSLER', 'CHRYSLER')], max_length=50)),
                ('line', models.CharField(default='LINE', max_length=50)),
                ('status', models.CharField(choices=[('OPEN', 'OPEN'), ('WAITING', 'WAITING'), ('CLOSED', 'CLOSED')], default='OPEN', max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='dr_item',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_no', models.CharField(max_length=50)),
                ('wos_no', models.CharField(default='', max_length=50)),
                ('first_quantity', models.IntegerField(default='')),
                ('second_quantity', models.IntegerField(default='')),
                ('third_quantity', models.IntegerField(default='')),
                ('fourth_quantity', models.IntegerField(default='')),
                ('fifth_quantity', models.IntegerField(default='')),
                ('control_noFK', models.ForeignKey(db_column='control_no', default='', on_delete=django.db.models.deletion.CASCADE, related_name='entries', to='foiling.dr_form', to_field='control_no')),
            ],
        ),
    ]
