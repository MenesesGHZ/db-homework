from django.db import models
from .base_model import BaseModelMixin


class OrderDetail(models.Model, BaseModelMixin):
    order = models.ForeignKey(
        'Order',
        on_delete=models.CASCADE,
    )
    product = models.ForeignKey(
        'Product',
        on_delete=models.CASCADE,
    )
    quantity = models.IntegerField()

    class Meta:
        db_table = "order_detail"
