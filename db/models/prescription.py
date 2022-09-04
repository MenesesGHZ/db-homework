from django.db import models
from .base_model import BaseModelMixin


class Prescription(models.Model, BaseModelMixin):
    doctor =  models.OneToOneField(
        'Branch',
         on_delete=models.CASCADE
    )

    class Meta:
        db_table = "prescription"
