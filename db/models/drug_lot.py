from django.db import models
from .base_model import BaseModelMixin


class DrugLot(models.Model, BaseModelMixin):
    order = models.ForeignKey(
        'Order',
        on_delete=models.CASCADE,
    )
    expiration = models.DateTimeField()
    details = models.TextField()

    class Meta:
        db_table = "drug_lot"
