from django.db import models

# Create your models here.
class BookModel(models.Model):
	bookName=models.CharField(max_length=50)
	bookPrice=models.CharField(max_length=5)
	bookPages=models.IntegerField()
	bookPublisher=models.CharField(max_length=30)


	def __str__(self):
		return self.bookName




