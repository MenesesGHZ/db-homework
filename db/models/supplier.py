from django.db import models
from .base_model import BaseModelMixin


class Supplier(models.Model, BaseModelMixin):
    name = models.CharField(max_length=30)
    phone_number = models.CharField(max_length=16)
    address = models.TextField()
    details = models.TextField()

    class Meta:
        db_table = "supplier"
