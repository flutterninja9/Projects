from django.shortcuts import render
from django.http import HttpResponse
from . import models
from rest_framework.generics import ListAPIView,DestroyAPIView
from rest_framework.response import Response
from . import serializers
from rest_framework.views import APIView
from django.views.decorators.csrf import csrf_exempt


def index(request):
	return render(request,'booksys/index.html')

def saveBook(request):
	if request.method=="GET":
		name=request.GET['name']
		price=request.GET['price']
		pages=request.GET['bookpage']
		publisher=request.GET['publisher']
		model=models.BookModel(bookName=name,bookPrice=price,bookPages=pages,bookPublisher=publisher)
		try:
			model.save()
			return HttpResponse('Saved')
		except(e):
			return HttpResponse(e)		

class bookList(ListAPIView):
	serializer_class=serializers.BookModelSer
	queryset=models.BookModel.objects.all()		


def delView(request):
	pk=request.GET['pk']
	model=models.BookModel.objects.get(id=pk)
	try:
		model.delete()
		return HttpResponse(1)
	except(e):
		return HttpResponse(0)	