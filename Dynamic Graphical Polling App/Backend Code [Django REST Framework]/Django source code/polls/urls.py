from django.urls import path
from . import views

urlpatterns = [
	path('',views.IndexView.as_view(),name='home'),
	path('vote',views.getpolls,name='homeui'),
	path('getpolls',views.ShowPollsView.as_view(),name='polls'),
	path('vote/<str:pk>/<str:vote>/',views.GiveVotesView.as_view(),name='giveVote'),
	path('getpolldetails/<str:pk>/',views.GetPollViewTest.as_view(),name='getPollTest'),
	path('create',views.CreatePollView.as_view(),name='create_poll'),
]