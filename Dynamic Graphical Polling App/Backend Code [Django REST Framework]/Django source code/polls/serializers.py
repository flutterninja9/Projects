from rest_framework.serializers import ModelSerializer
from . import models

class PollSerializer(ModelSerializer):

	class Meta:
		model=models.Poll
		fields="__all__"
