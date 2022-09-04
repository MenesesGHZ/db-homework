from django.db import models
from .base_model import BaseModelMixin


class Product(models.Model, BaseModelMixin):
    branch =  models.OneToOneField(
        'Branch',
         on_delete=models.CASCADE
    )
    supplier = models.OneToOneField(
        'Supplier',
         on_delete=models.CASCADE
    )
    drug = models.OneToOneField(
        'Drug',
         on_delete=models.CASCADE
    )
    price = models.FloatField()

    class Meta:
        db_table = "product"
