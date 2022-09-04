from django.db import models
from .base_model import BaseModelMixin


class PrescriptionDetail(models.Model, BaseModelMixin):
    prescription = models.ForeignKey(
        'Prescription',
        on_delete=models.CASCADE,
    )
    drug = models.OneToOneField(
        'Drug',
         on_delete=models.CASCADE
    )
    details = models.TextField()

    class Meta:
        db_table = "prescription_detail"
