from django.http import HttpResponse
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from . import models
from .serializers import PollSerializer
from rest_framework.generics import ListAPIView,RetrieveAPIView,CreateAPIView
# Create your views here.

class IndexView(APIView):
	def get(self,request):
	    return Response({'ok':'success'})

class ShowPollsView(APIView):
	def get(self,request):
		pollModelA=models.Poll.objects.all()
		model=PollSerializer(pollModelA,many=True).data
		return Response(model)

class GiveVotesView(APIView):
	def get(self,request,pk,vote):
		pollModelA=models.Poll.objects.get(id=pk)
		if vote=="1":
		    pollModelA.option1_count+=1
		elif vote=="2":
		    pollModelA.option2_count+=1
		elif vote=="3":
		    pollModelA.option3_count+=1
		elif vote=="4":
		    pollModelA.option4_count+=1
		pollModelA.save()
		return Response({'success':'vote_success'})


class GetPollViewTest(APIView):
	def get(self,request,pk):
	    model=models.Poll.objects.filter(id=pk)[0]
	    modelSer=PollSerializer(model)
	    totalVotes=model.get_total_count()
	    return Response({'data':modelSer.data,'totalVotes':totalVotes})


class CreatePollView(CreateAPIView):
    serializer_class=PollSerializer
    queryset=models.Poll.objects.all()


def getpolls(request):
    pk=request.GET['poll_id']
    model=models.Poll.objects.get(id=pk)
    context={'poll_id':id,'model':model}
    return render(request,'polls/index.html',context=context)






















