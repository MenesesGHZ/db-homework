from django.db import models
from .base_model import BaseModelMixin


class Drug(models.Model, BaseModelMixin):
    name = models.CharField(max_length=50)
    category = models.CharField(max_length=15)
    drug_lot = models.ForeignKey(
        "DrugLot",
        on_delete=models.CASCADE
    )
    details = models.TextField()

    class Meta:
        db_table = "drug"
