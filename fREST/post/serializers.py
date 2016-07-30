#coding: utf-8

from rest_framework import serializers
from .models import *
from django.contrib.auth.models import User
from post.models import ModelUser, Post, Category, Sity, Country, Image

class CountrySerializer(serializers.ModelSerializer):
	class Meta:
		model = Country
		fields = ('pk', 'name')
		
class SitySerializer(serializers.ModelSerializer):
	country = CountrySerializer(serializers.PrimaryKeyRelatedField(many=False, read_only=True))
	
	class Meta:
		model = Sity
		fields = ('pk', 'country', 'name')
		
class SityOnlySerializer(serializers.ModelSerializer):
	class Meta:
		model = Sity
		fields = ('pk', 'country', 'name')
		
class UserSerializer(serializers.ModelSerializer):
	sity = SitySerializer(serializers.PrimaryKeyRelatedField(many=False, read_only=True))
	
	class Meta:
		model = ModelUser
		fields = ('pk', 'username', 'first_name', 'last_name', 'email', 'sity', 'is_staff', 'is_active', 'last_login', 'date_joined')
		
class UsernlySerializer(serializers.ModelSerializer):
	class Meta:
		model = ModelUser
		fields = ('username', 'email', 'password', 'sity', 'is_staff', 'is_active', 'last_login', 'date_joined')
	
#class ImageOnlySerializer(serializers.ModelSerializer):
#	image = serializers.ImageField(source='image_original', use_url=True)

#	class Meta:
#		model = Image
#		fields = ('image')

class ImageOnlySerializer(serializers.Serializer):
	id = serializers.IntegerField(source='pk')
	img_original = serializers.ImageField(source='image_original', use_url=True)
	img = serializers.ImageField(source='image', use_url=True)
	img_preview = serializers.ImageField(source='image_preview', use_url=True)
	
#	def create(self, validated_data):
#		return Image(image_original=validated_data.get('image_original').read())
	
class ImagesSerializer(serializers.Serializer):
	img = serializers.ImageField(source='image', use_url=True)
	img_preview = serializers.ImageField(source='image_preview', use_url=True)
		
class CategoryOnlySerializer(serializers.ModelSerializer):
	class Meta:
		model = Category
		fields = ('pk', 'name')
		
class PostSerializer(serializers.ModelSerializer):
	category = CategoryOnlySerializer(serializers.PrimaryKeyRelatedField(many=False, read_only=True))
	images = ImageOnlySerializer(serializers.PrimaryKeyRelatedField(many=True, read_only=True))
	
	class Meta:
		model = Post
		fields = ('pk', 'category', 'header', 'subheader', 'text', 'images')
		
class PostOnlySerializer(serializers.ModelSerializer):
	class Meta:
		model = Post
		fields = ('pk', 'category', 'header', 'subheader', 'text', 'images', 'user', 'date_edit')
		
class ProfileSerialiser(serializers.ModelSerializer):
	#sity = SitySerializer(serializers.PrimaryKeyRelatedField(many=False, read_only=True))
	#favorites = PostSerializer(serializers.PrimaryKeyRelatedField(many=True, read_only=True))
	
	class Meta:
		model = ModelUser
		fields = ('first_name', 'last_name', 'email', 'sity', 'is_staff', 'is_active', 'last_login', 'date_joined', 'favorites')
