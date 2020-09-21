from django.db import models

# Create your models here.
class Poll(models.Model):
	pollQuestion=models.CharField(max_length=100)
	option_1=models.CharField(max_length=15,default="")
	option_2=models.CharField(max_length=15,default="")
	option_3=models.CharField(max_length=15,default="")
	option_4=models.CharField(max_length=15,default="")
	option1_count=models.IntegerField(default=0)
	option2_count=models.IntegerField(default=0)
	option3_count=models.IntegerField(default=0)
	option4_count=models.IntegerField(default=0)
	isActive=models.BooleanField(default=True)

	createdOn=models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return self.pollQuestion


	def get_total_count(self):
	    return self.option1_count+self.option2_count+self.option3_count+self.option4_count
