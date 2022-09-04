from django.db import models
from .base_model import BaseModelMixin

class RoleOptions(models.TextChoices):
    ADMIN = "AD", "admin"
    MANAGER = "MA", "manager"
    STAFF = "ST", "staff"
    GENERAL = "GE", "general"

class Client(models.Model, BaseModelMixin):
    user = models.OneToOneField("User", on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=14)
    role = models.CharField(max_length=2, choices=RoleOptions.choices)

    class Meta:
        db_table = "client"
