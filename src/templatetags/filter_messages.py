from django import template

register = template.Library()


@register.filter
def filter_messages(value):
    if value == "debug":
        val = "primary"
    elif value == "error":
        val = "danger"
    else:
        val = value
    return val