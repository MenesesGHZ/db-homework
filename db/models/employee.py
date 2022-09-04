from django.db import models
from .base_model import BaseModelMixin


class Employee(models.Model, BaseModelMixin):
    user = models.OneToOneField("User", on_delete=models.CASCADE)
    branch = models.ForeignKey("Branch", on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=16)
    address = models.TextField()

    class Meta:
        db_table = "employee"
