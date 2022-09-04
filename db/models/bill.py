from django.db import models
from .base_model import BaseModelMixin

class PaymentMethodOptions(models.TextChoices):
    CASH = "CA", "cash"
    DEBIT_CARD =  "DC", "debit_card"
    CREDIT_CARD = "CC", "credit_card"

class Bill(models.Model, BaseModelMixin):
    client = models.ForeignKey("Client", on_delete=models.CASCADE)
    employee = models.ForeignKey("Employee", on_delete=models.CASCADE)
    branch = models.ForeignKey("Branch", on_delete=models.CASCADE)
    payment_method = models.CharField(max_length=2, choices=PaymentMethodOptions.choices)

    class Meta:
        db_table = "bill"
