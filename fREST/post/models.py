#coding: utf-8

from __future__ import unicode_literals

from django.db import models

#from PIL import Image
from imagekit.models.fields import ImageSpecField
from imagekit.processors import ResizeToFit, ResizeToFill
from django.contrib.auth.models import User

# Create your models here.

class Contry(models.Model):
	name = models.CharField(max_length=30)
	
	def __unicode__(self):
		return self.name
		
class Sity(models.Model):
	name = models.CharField(max_length=30)
	contry = models.ForeignKey(Contry)
	
	def __unicode__(self):
		return self.contry + ', ' + self.name
		
class Category(models.Model):
	name = models.CharField(max_length=30) 
	
	def __unicode__(self):
		return self.name
		
class Image(models.Model):
	image_original = models.ImageField(upload_to='post_image/')#, match='^\w*.jpeg|png|JPEG|PNG$')
	image_preview = ImageSpecField(source='image_original', processors=[ResizeToFill(200, 200)], format='JPEG', options={'quality': 60})
	image = ImageSpecField(source='image_original', processors=[ResizeToFit(width=1024, height=768, upscale=False)], format='JPEG', options={'quality': 60})
	
	def __unicode__(self):
		return self.image_original

class Post(models.Model):
	header = models.CharField(max_length=30)
	subheader = models.CharField(max_length=30)
	text = models.TextField()
	images = models.ManyToManyField(Image)
	user = models.ForeignKey(User)
	date = models.DateTimeField(auto_now_add=True, editable=False)
	date_edit = models.DateTimeField(auto_now=True, editable=False)
	
class Favorites(models.Model):
	user = models.ForeignKey(User)
	favorites = models.ManyToManyField(Post)
