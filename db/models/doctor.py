from django.db import models
from .base_model import BaseModelMixin


class Doctor(models.Model, BaseModelMixin):
    user = models.OneToOneField("User", on_delete=models.CASCADE)
    license_number = models.CharField(max_length=30)
    phone_number = models.CharField(max_length=16)

    class Meta:
        db_table = "doctor"
