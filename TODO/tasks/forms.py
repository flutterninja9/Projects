from django.forms import ModelForm
from . import models

class TaskForm(ModelForm):

	class Meta:
		model=models.Task
		fields="__all__"