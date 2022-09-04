from django.db import models
from .base_model import BaseModelMixin


class Order(models.Model, BaseModelMixin):
    supplier = models.ForeignKey(
        'Supplier',
        on_delete=models.CASCADE,
    )
    branch = models.ForeignKey(
        'Branch',
        on_delete=models.CASCADE,
    )
    placement_date = models.DateTimeField(null=True, blank=True)
    received_data = models.DateTimeField(null=True, blank=True)
    total = models.FloatField()

    class Meta:
        db_table = "order"
