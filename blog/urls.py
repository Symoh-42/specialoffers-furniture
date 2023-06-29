from django.urls import path

from . import views

urlpatterns = [
    path('mainblog/', views.mainblogPage, name='mainblog'),

    path('singleblog/<post>/', views.singleblogPage, name='singleblog'),
    path('singleblog/comment/<post>/', views.singleblogPageComment, name='singleblogcomment'),
    
    path('authors/', views.authorsPage, name='authors'),

    path('youtube_videos/', views.youtube_videosPage, name='youtube_videos'),

    path('search_blog/', views.search_blogPage, name='search_blog'),
]