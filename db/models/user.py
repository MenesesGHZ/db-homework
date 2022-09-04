from django.db import models
from .base_model import BaseModelMixin


class User(models.Model, BaseModelMixin):
    firstname = models.CharField(max_length=30)
    lastname = models.CharField(max_length=30)
    email = models.EmailField(max_length=40)

    class Meta:
        db_table = "user"
