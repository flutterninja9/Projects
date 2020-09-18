from django.shortcuts import render,redirect
from django.http import HttpResponse
from . import models
from . import forms

# Create your views here.

def index(request):
	tasks=models.Task.objects.all()
	form=forms.TaskForm()
	context={'tasks':tasks,'form':form}

	if request.method == "POST":
		form=forms.TaskForm(request.POST)
		if form.is_valid():
			form.save()
		return 	redirect('/todo/')
	return render(request,'tasks/index.html',context=context)


def update(request,pk):
	task=models.Task.objects.get(id=pk)
	form=forms.TaskForm(instance=task)
	context={'form' : form}
	if request.method=="POST":
		form=forms.TaskForm(request.POST,instance=task)
		if form.is_valid():
			form.save()
		return redirect('/todo/')	
	return render(request,'tasks/update_task.html',context=context)

def deleteTask(request,pk):
	item=models.Task.objects.get(id=pk)
	context={'item':item}
	if request.method=="POST":
		item.delete()
		return redirect('/todo/')
	return render(request,'tasks/delete.html',context=context)
