#coding: utf-8

from django.shortcuts import render

# Create your views here.

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import *
from .serializers import *
from django.contrib.auth import hashers


'''
Декораторы, для уменьшения объема кода
'''
#Для всех, редакт админы------------------------------------------
def post_get(function):
	def resp(request):
		if request.method == 'GET':
			objects = function()
			serializer = function(obj=objects)
			return Response(serializer.data)
		if request.auth:
			if request.user.is_active and request.user.is_staff:
				if request.method == 'POST':
					serializer = function(serializer=True)(data=request.data)
					if serializer.is_valid():
						serializer.save()
						return Response(serializer.data, status = status.HTTP_201_CREATED)
					return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
	
def post_detail(function):
	def resp(request, pk):
		try:
			objects = function(pk=pk)
		except Country.DoesNotExist:
			return Response(status=status.HTTP_404_NOT_FOUND)
		
		if request.method == 'GET':
			serializer = function(obj=objects)
			return Response(serializer.data)
		
		if request.auth:
			if request.user.is_active and request.user.is_staff:
				if request.method == 'PUT':
					serializer = function(serializer=True)(objects, data=request.data)
					if serializer.is_valid():
						serializer.save()
						return Response(serializer.data)
					return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		
				elif request.method == 'DELETE':
					objects.delete()
					return Response(status=status.HTTP_204_NO_CONTENT)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp

#Для регистрации-----------------------------------------
def post_get_reg(function):
	def resp(request):
		if request.method == 'POST':
			serializer = function(serializer=True)(data=request.data)
			if serializer.is_valid():
				serializer.save()
				return Response(serializer.data, status = status.HTTP_201_CREATED)
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
			
			
#Редакт Админ Просмотр авторизованные -------------------------------------------
def post_get_admin(function):
	def resp(request):
		if request.auth:
			if request.user.is_active:
				if request.method == 'GET':
					objects = function()
					serializer = function(obj=objects)
					return Response(serializer.data)
				if request.user.is_staff:
					if request.method == 'POST':
						serializer = function(serializer=True)(data=request.data)
						if serializer.is_valid():
							serializer.save()
							return Response(serializer.data, status = status.HTTP_201_CREATED)
						return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
			

def post_detail_admin(function):
	def resp(request, pk):
		if request.auth:
			if request.user.is_active:
				try:
					objects = function(pk=pk)
				except Country.DoesNotExist:
					return Response(status=status.HTTP_404_NOT_FOUND)
		
				if request.method == 'GET':
					serializer = function(obj=objects)
					return Response(serializer.data)
		
				if request.user.is_staff:
					if request.method == 'PUT':
						serializer = function(serializer=True)(objects, data=request.data)
						if serializer.is_valid():
							serializer.save()
							return Response(serializer.data)
						return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		
					elif request.method == 'DELETE':
						objects.delete()
						return Response(status=status.HTTP_204_NO_CONTENT)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
	
def post_detail_me(function):
	def resp(request, pk):
		if request.auth:
			if request.user.is_active:
				try:
					objects = function(pk=pk)
				except Country.DoesNotExist:
					return Response(status=status.HTTP_404_NOT_FOUND)
		
				if request.method == 'GET':
					serializer = function(obj=objects)
					return Response(serializer.data)
		
				if request.user.pk == objects.pk:
					if request.method == 'PUT':
						serializer = function(serializer=True)(objects, data=request.data)
						if serializer.is_valid():
							serializer.save()
							return Response(serializer.data)
						return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		
					elif request.method == 'DELETE':
						objects.is_active = False
						return Response(status=status.HTTP_204_NO_CONTENT)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
			

#Только для авторизованных-------------------------
def post_get_auth(function):
	def resp(request):
		if request.auth:
			if request.user.is_active:
				if request.method == 'GET':
					objects = function()
					serializer = function(obj=objects)
					return Response(serializer.data)
				elif request.method == 'POST':
					serializer = function(serializer=True)(data=request.data)
					if serializer.is_valid():
						data_one = serializer.data
						data_one['user'] = request.user.pk
						serializer = function(serializer=True)(data=data_one)
						if serializer.is_valid():
							serializer.save()
						return Response(serializer.data, status = status.HTTP_201_CREATED)
					return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
	
def post_detail_auth(function):
	def resp(request, pk):
		if request.auth:
			if request.user.is_active:
				try:
					objects = function(pk=pk)
				except Country.DoesNotExist:
					return Response(status=status.HTTP_404_NOT_FOUND)
		
				if request.method == 'GET':
					serializer = function(obj=objects)
					return Response(serializer.data)
		
				elif request.method == 'PUT':
					serializer = function(serializer=True)(objects, data=request.data)
					if serializer.is_valid():
						serializer.save()
						return Response(serializer.data)
					return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		
				elif request.method == 'DELETE':
					objects.delete()
					return Response(status=status.HTTP_204_NO_CONTENT)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
	
			
#Правка для владельца и админа просмотр для авторизованных ---------------
def post_detail_author(function):
	def resp(request, pk):
		if request.auth:
			if request.user.is_active:
				try:
					objects = function(pk=pk)
				except Country.DoesNotExist:
					return Response(status=status.HTTP_404_NOT_FOUND)
		
				if request.method == 'GET':
					serializer = function(obj=objects)
					return Response(serializer.data)
					
				if (request.user.pk == objects.user.pk) or request.user.is_staff:
					if request.method == 'PUT':
						serializer = function(serializer=True)(objects, data=request.data)
						print request.data
						if serializer.is_valid():
							serializer.save()
							print serializer.data
							return Response(serializer.data)
						return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		
					elif request.method == 'DELETE':
						objects.delete()
						return Response(status=status.HTTP_204_NO_CONTENT)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
				

# только для админов, добавление для всех
def post_get_admin_only(function):
	def resp(request):
		if request.method == 'POST':
			serializer = function(serializer=True)(data=request.data)
			if serializer.is_valid():
				data_one = serializer.data
				data_one['password'] = hashers.make_password(data_one['password'])
				data_one['is_active'] = True
				serializer = function(serializer=True)(data=data_one)
				if serializer.is_valid():
					serializer.save()
				return Response(serializer.data, status = status.HTTP_201_CREATED)
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		if request.auth:
			if request.user.is_active:
				if request.user.is_staff:
					if request.method == 'GET':
						objects = function()
						serializer = function(obj=objects)
						return Response(serializer.data)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
	
def post_detail_admin_only(function):
	def resp(request, pk):
		if request.auth:
			if request.user.is_active:
				if request.user.is_staff:
					try:
						objects = function(pk=pk)
					except Country.DoesNotExist:
						return Response(status=status.HTTP_404_NOT_FOUND)
		
					if request.method == 'GET':
						serializer = function(obj=objects)
						return Response(serializer.data)
		
					elif request.method == 'PUT':
						serializer = function(serializer=True)(objects, data=request.data)
						if serializer.is_valid():
							serializer.save()
							return Response(serializer.data)
						return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		
					elif request.method == 'DELETE':
						objects.delete()
						return Response(status=status.HTTP_204_NO_CONTENT)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
	
	
#Только для авторизованных для картинок-------------------------
def post_get_image(function):
	def resp(request):
		if request.auth:
			if request.user.is_active:
				if request.method == 'GET':
					objects = function()
					serializer = function(obj=objects)
					return Response(serializer.data)
				elif request.method == 'POST':
					image = Image()
					image.image_original = request.data['image_original']
					image.save()
					serializer = function(serializer=True)(image)
					return Response(serializer.data, status = status.HTTP_201_CREATED)
					return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp
	
def post_detail_image(function):
	def resp(request, pk):
		if request.auth:
			if request.user.is_active:
				try:
					objects = function(pk=pk)
				except Country.DoesNotExist:
					return Response(status=status.HTTP_404_NOT_FOUND)
		
				if request.method == 'GET':
					serializer = function(obj=objects)
					return Response(serializer.data)
		
				elif request.method == 'PUT':
					serializer = function(serializer=True)(objects, data=request.data)
					if serializer.is_valid():
						serializer.save()
						return Response(serializer.data)
					return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
		
				elif request.method == 'DELETE':
					objects.delete()
					return Response(status=status.HTTP_204_NO_CONTENT)
		return Response(status=status.HTTP_401_UNAUTHORIZED)
	return resp


'''
Представления ---------------------------------------------------------------------
'''

#Страны===========================================
@api_view(['GET', 'POST'])
@post_get
def post_get_country(obj=None, serializer=False):
	if serializer:
		return CountrySerializer
	elif obj:
		return CountrySerializer(obj, many=True)
	else:
		return Country.objects.all()
	
	
@api_view(['GET', 'PUT', 'DELETE'])
@post_detail	
def post_detail_country(obj=None, serializer=False, pk=None):
	if pk:
		return Country.objects.get(pk=pk)
	elif serializer:
		return CountrySerializer
	elif obj:
		return CountrySerializer(obj)
	else:
		return None
	

#Города =====================================================
@api_view(['GET', 'POST'])
@post_get
def post_get_sity(obj=None, serializer=False):
	if serializer:
		return SityOnlySerializer
	elif obj:
		return SityOnlySerializer(obj, many=True)
	else:
		return Sity.objects.all()
	
	
@api_view(['GET', 'PUT', 'DELETE'])
@post_detail
def post_detail_sity(obj=None, serializer=False, pk=None):
	if pk:
		return Sity.objects.get(pk=pk)
	elif serializer:
		return SityOnlySerializer
	elif obj:
		return SityOnlySerializer(obj)
	else:
		return None
		
		
#Категории====================================================
@api_view(['GET', 'POST'])
@post_get_admin
def post_get_category(obj=None, serializer=False):
	if serializer:
		return CategoryOnlySerializer
	elif obj:
		return CategoryOnlySerializer(obj, many=True)
	else:
		return Category.objects.all()
	
	
@api_view(['GET', 'PUT', 'DELETE'])
@post_detail_admin	
def post_detail_category(obj=None, serializer=False, pk=None):
	if pk:
		return Category.objects.get(pk=pk)
	elif serializer:
		return CategoryOnlySerializer
	elif obj:
		return CategoryOnlySerializer(obj)
	else:
		return None
		
		
#Посты все ===============================================
@api_view(['GET', 'POST'])
@post_get_auth
def post_get_post(obj=None, serializer=False):
	if serializer:
		return PostOnlySerializer
	elif obj:
		return PostOnlySerializer(obj, many=True)
	else:
		return Post.objects.all()
	
	
@api_view(['GET', 'PUT', 'DELETE'])
@post_detail_author
def post_detail_post(obj=None, serializer=False, pk=None):
	if pk:
		return Post.objects.get(pk=pk)
	elif serializer:
		return PostOnlySerializer
	elif obj:
		return PostOnlySerializer(obj)
	else:
		return None
		
#Посты по категории ------------------------------------------
@api_view(['GET'])
@post_detail_auth
def post_detail_post_category(obj=None, serializer=False, pk=None):
	if pk:
		return Post.objects.filter(category__pk=pk)
	elif obj:
		return PostOnlySerializer(obj, many=True)
	else:
		return None
		
		
#Тизеры постов ====================================================
@api_view(['GET'])
@post_get_auth
def post_get_post_tizer(obj=None, serializer=False):
	if obj:
		return PostSerializer(obj, many=True)
	else:
		return Post.objects.all()
	
	
@api_view(['GET'])
@post_detail_auth	
def post_detail_post_tizer(obj=None, serializer=False, pk=None):
	if pk:
		return Post.objects.get(pk=pk)
	elif obj:
		return PostSerializer(obj)
	else:
		return None
		
#Тизеры по категории ------------------------------------------
@api_view(['GET'])
@post_detail_auth
def post_detail_tizer_category(obj=None, serializer=False, pk=None):
	if pk:
		return Post.objects.filter(category__pk=pk)
	elif obj:
		return PostSerializer(obj)
	else:
		return None
		
		
#Профиль ============================
@api_view(['GET'])
@post_get_admin
def post_get_profile(obj=None, serializer=False):
	if serializer:
		return ProfileSerialiser
	elif obj:
		return ProfileSerialiser(obj, many=True)
	else:
		return ModelUser.objects.all()
	
	
@api_view(['GET', 'PUT'])
@post_detail_me
def post_detail_profile(obj=None, serializer=False, pk=None):
	if pk:
		return ModelUser.objects.get(pk=pk)
	elif serializer:
		return ProfileSerialiser
	elif obj:
		return ProfileSerialiser(obj)
	else:
		return None
		
		
#Управление пользователями
@api_view(['GET', 'POST'])
@post_get_admin_only
def post_get_user(obj=None, serializer=False):
	if serializer:
		return UserOnlySerializer
	elif obj:
		return UserOnlySerializer(obj, many=True)
	else:
		return ModelUser.objects.all()
	
	
@api_view(['GET', 'PUT', 'DELETE'])
@post_detail_admin_only	
def post_detail_user(obj=None, serializer=False, pk=None):
	if pk:
		return ModelUser.objects.get(pk=pk)
	elif serializer:
		return UserOnlySerializer
	elif obj:
		return UserOnlySerializer(obj)
	else:
		return None
		
		
#Картинки
@api_view(['GET', 'POST'])
@post_get_image
def post_get_images(obj=None, serializer=False):
	if serializer:
		return ImageOnlySerializer
	elif obj:
		return ImageOnlySerializer(obj, many=True)
	else:
		return Image.objects.all()
	
	
@api_view(['GET', 'PUT', 'DELETE'])
@post_detail_image
def post_detail_images(obj=None, serializer=False, pk=None):
	if pk:
		return Image.objects.get(pk=pk)
	elif serializer:
		return ImageOnlySerializer
	elif obj:
		return ImageOnlySerializer(obj)
	else:
		return None
