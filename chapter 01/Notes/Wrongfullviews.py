# this was causing issue most likely
# this was in the mysite/blog/templates/post/ dir
# because of which the post were not

'''
from django.http import Http404
from mysite.blog.models import Post
from django.shortcuts import render


def post_detail(request, id):
    try:
        post = Post.published.get(id=id)
    except Post.DoesNotExist:
        raise Http404("No Post found.")

    return render(request,
                  'blog/post/detail.html',
                  {'post': post})
'''
