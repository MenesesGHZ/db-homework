from django.db import models
from .base_model import BaseModelMixin


class Branch(models.Model, BaseModelMixin):
    name = models.CharField(max_length=30)
    address = models.TextField()
    phone_number = models.CharField(max_length=16)

    class Meta:
        db_table = "branch"
