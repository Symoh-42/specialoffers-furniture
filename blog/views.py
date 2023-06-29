from multiprocessing import context
from django.shortcuts import render
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.contrib import messages
from django.http import HttpResponseRedirect`
from django.db.models import Q
from django.shortcuts import render, get_object_or_404

from blog.models import BlogPost, BlogAuthor, YoutubeVideo
from .forms import NewsletterForm, CommentForm

# Create your views here.
def mainblogPage(request):
     posts = BlogPost.objects.order_by('updated_at').filter(featured=False).all()
     paginator = Paginator(posts, 10)
     page = request.GET.get('page')
     paged_posts = paginator.get_page(page)
     featured_post = BlogPost.objects.filter(featured=True).all()
     authors = BlogAuthor.objects.order_by('updated_at').all()

     youtube_videos = YoutubeVideo.objects.order_by('updated_at').all()

     if request.method == 'POST':
          form = NewsletterForm(request.POST)
          if form.is_valid():
               form.save()
               messages.success(request, 'Subscription Successful')
               return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
     else:
          form = NewsletterForm()

     # print(posts)
     context = {  
          'posts':paged_posts,
          'featured_post':featured_post,
          'authors':authors,
          'form':form,
          'youtube_videos':youtube_videos
     }
     return render (request, 'blog/mainblog.html', context)

def singleblogPageComment(request, post):
     post = get_object_or_404(BlogPost, slug=post)
     
     if request.method == 'POST':
          comment_form = CommentForm(request.POST)
          if comment_form.is_valid():
               user_comment = comment_form.save(commit = False)
               user_comment.blog = post
               user_comment.save()

          return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def singleblogPage(request, post):
     post = get_object_or_404(BlogPost, slug=post)

     posts = BlogPost.objects.order_by('updated_at')[:5]
     comments = post.comments.filter(status=True)

     user_comment = None

     if request.method == 'POST':
          form = NewsletterForm(request.POST)
          comment_form = CommentForm(request.POST)
          if form.is_valid():
               form.save()
               messages.success(request, 'Subscription Successful')
               return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
     else:
          form = NewsletterForm()
          
     comment_form = CommentForm()
     
     youtube_videos = YoutubeVideo.objects.order_by('updated_at').all()

     context = {
          'post':post,
          'posts':posts,
          'form':form,
          'comments':user_comment,
          'comments':comments,
          'comment_form':comment_form,
          'youtube_videos':youtube_videos,
     }
     return render (request, 'blog/singleblog.html', context)

def authorsPage(request):
     writers =BlogAuthor.objects.order_by('updated_at').all()

     paginator = Paginator(writers, 10)
     page = request.GET.get('page')
     paged_writers = paginator.get_page(page)

     if request.method == 'POST':
          form = NewsletterForm(request.POST)
          if form.is_valid():
               form.save()
               messages.success(request, 'Subscription Successful')
               return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
     else:
          form = NewsletterForm()

     context = {
          'writers':paged_writers,
          'form':form
     }

     return render (request, 'blog/authors.html', context)

def youtube_videosPage(request):
     youtube_videos = YoutubeVideo.objects.order_by('updated_at').all()

     paginator = Paginator(youtube_videos, 10)
     page = request.GET.get('page')
     paged_youtube_videos = paginator.get_page(page)

     if request.method == 'POST':
          form = NewsletterForm(request.POST)
          if form.is_valid():
               form.save()
               messages.success(request, 'Subscription Successful')
               return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
     else:
          form = NewsletterForm()

     context = {
          'youtube_videos':paged_youtube_videos,
          'form':form
     }

     return render (request, 'blog/youtube.html', context)


def search_blogPage(request):
    if 'keyword' in request.GET:
        keyword = request.GET['keyword']
        if keyword:
            blogPost = BlogPost.objects.order_by('-created_at').filter(Q(blog_intro__icontains=keyword) | Q(title__icontains=keyword))
    
    context = {
        'blogPost':blogPost,
    }

    return render (request, 'store/search.html', context)