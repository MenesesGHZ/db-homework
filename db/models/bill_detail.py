from django.db import models
from .base_model import BaseModelMixin


class BillDetail(models.Model, BaseModelMixin):
    bill = models.ForeignKey("Bill", on_delete=models.CASCADE)
    product = models.ForeignKey("Employee", on_delete=models.CASCADE)
    prescription = models.ForeignKey("Prescription", on_delete=models.CASCADE)
    quantity = models.IntegerField()
    total = models.FloatField()

    class Meta:
        db_table = "bill_detail"
