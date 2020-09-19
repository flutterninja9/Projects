from rest_framework.serializers import ModelSerializer
from . import models

class BookModelSer(ModelSerializer):
	class Meta:
		model=models.BookModel
		fields="__all__"
