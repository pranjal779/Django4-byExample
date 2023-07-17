  Id     Duration CommandLine
  --     -------- -----------
   1        0.305 try { . "c:\Users\prath\AppData\Local\Programs\Microsoft VS Code\resources\app\out\v…
   2  1:11:57.282 python
   3       18.125 py -m venv Django_Env
   4        0.398 '.\Django_Env\Scripts\activate'
   5        0.023 clear
   6       18.120 pip install Django~=4.1.0
   7        2.469 python -m django --version
   8       15.116 django-admin startproject mysite

   You can deactivate your environment at any time with the deactivate command

   python manage.py makemigrations blog

   python manage.py sqlmigrate blog 0001

   python manage.py migrate

   python manage.py createsuperuser

   python manage.py runserver

   <url>/admin/ or <url>/blog/

   (Django_Env) PS C:\Users\prath\Desktop\pranjals studies\Github studies\Django\mysite> python manage.py shell    
Python 3.11.2 (tags/v3.11.2:878ead1, Feb  7 2023, 16:38:35) [MSC v.1934 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from django.contrib.auth.models import User
>>> from blog.models import Post
>>> user = User.objects.get(username='pran779')
>>> post = Post(title='Another post',
...             slug='another-post',
...             body='Post body.',
...             author=user) 
>>> post.save()
>>>

# page 57 explanation

>>> post.title = 'New title'
>>> post.save()

>>> all_posts = Post.objects.all()
>>> Post.objects.all()
<QuerySet [<Post: New title>, <Post: New-Entry>, <Post: Who was Django Reinhardt>]>        
>>> Post.objects.filter(publish__year=2022)
<QuerySet []>
>>> Post.objects.filter(publish_year=2022)  
Traceback (most recent call last): ...........
<QuerySet []>
>>> Post.objects.filter(publish__year-2022) \
...             .filter(author__username='admin')
Traceback (most recent call last):
  File "<console>", line 1, in <module>
NameError: name 'publish__year' is not defined
>>> Post.objects.filter(publish__year=2022) \
...             .filter(author__username='admin')
<QuerySet []>

Queries with field lookup methods are built using two underscores, for example, publish__
year, but the same notation is also used for accessing fields of related models, such as 
author__username.
   
>>> Post.objects.filter(publish__year=2022) \
...             .exclude(title__startswith='Why')
<QuerySet []>
   
>>> Post.objects.filter(publish__year=2022) \
...             .exclude(title__startswith='Why')
<QuerySet []>
>>> Post.objects.order_by('title')
<QuerySet [<Post: New title>, <Post: New-Entry>, <Post: Who was Django Reinhardt>]> 

>>> # descending order
>>> Post.objects.order_by('-title')
<QuerySet [<Post: Who was Django Reinhardt>, <Post: New-Entry>, <Post: New title>]>        
>>> 

>>> # Deleting objects
>>> post = Post.objects.get(id=1)
>>> post.delete()
(1, {'blog.Post': 1})
>>>

after making changes in the blog.models.py

exit the shell before or after making the changes in blog.models.py

(Django_Env) PS C:\Users\prath\Desktop\pranjals studies\Github studies\Django\mysite> python manage.py shell
Python 3.11.2 (tags/v3.11.2:878ead1, Feb  7 2023, 16:38:35) [MSC v.1934 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from blog.models import Post
>>> Post.published.filter(title__startswith='Who')
<QuerySet []>
>>>


PS C:\Users\prath\Desktop\pranjals studies\Github studies\Django> .\Django_Env\Scripts\activate