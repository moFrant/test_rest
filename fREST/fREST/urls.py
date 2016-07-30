#coding: utf-8

"""fREST URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from rest_framework.authtoken import views as tok_views
from post import views
from rest_framework.urlpatterns import format_suffix_patterns

urlpatterns = [
    #url(r'^admin/', admin.site.urls),
    url(r'^api-token-auth/', tok_views.obtain_auth_token), #авторизоция
    url(r'^country/$', views.post_get_country), #получение всех стран, а так же добавление новой для админа
    url(r'^country/(?P<pk>[0-9]+)$', views.post_detail_country), #получение одной страны, изменение и удаление для админа
    url(r'^sity/$', views.post_get_sity), #получение всех городов, добавление нового для админа
    url(r'^sity/(?P<pk>[0-9]+)$', views.post_detail_sity), #получение одного города, изменение и удаление для админа
    url(r'^category/$', views.post_get_category), #получения всех категорий для авторизованного пользователя, а так же добавление новой для админа
    url(r'^category/(?P<pk>[0-9]+)$', views.post_detail_category), #получение одной категории для авторизованного пользователя, изменение и удаление для админа
    url(r'^post/$', views.post_get_post), #получение всех постов для авторизованных, добавление для авторизованных
    url(r'^post/(?P<pk>[0-9]+)$', views.post_detail_post),#получение одного поста для авторизованных, изменение и удаление для автора и админа
    url(r'^post_category/(?P<pk>[0-9]+)$', views.post_detail_post_category), #получение всех постов по одной категории для авторизованных
    url(r'^profile/$', views.post_get_profile), #получение всех профилей с избранным для авторизованных
    url(r'^profile/(?P<pk>[0-9]+)$', views.post_detail_profile), #получение одного профиля для авторизованных
    url(r'^users/$', views.post_get_user), #получение данных пользователя, а так же добавление для админа
    url(r'^users/(?P<pk>[0-9]+)$', views.post_detail_user), # получение данных о пользователе, изменение и удаление для админа
    url(r'^images/$', views.post_get_images),
    url(r'^images/(?P<pk>[0-9]+)$', views.post_detail_images),
]

urlpatterns = format_suffix_patterns(urlpatterns)
