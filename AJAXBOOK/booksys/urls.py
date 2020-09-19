from django.urls import path
from . import views

urlpatterns = [
	path('',views.index,name="home"),
	path('save_book',views.saveBook,name="save_book"),
	path('list_books',views.bookList.as_view(),name="save_book"),
	path('delete',views.delView,name="delete_book"),
]