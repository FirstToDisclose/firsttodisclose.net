class Disclosure(models.Model):


    title = models.CharField(max_length=255)
    URI = models.CharField(max_length=255)
    abstract = models.TextField()
    body = models.TextField()
    licensed = models.Licensed(auto_now_add=True)
    tag = models.CharField(max_length=255)
    owner = models.ForeignKey(User)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    
    
   
