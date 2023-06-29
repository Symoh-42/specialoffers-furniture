from django.utils import timezone
from django.shortcuts import render

from category.models import Category
from subcategory.models import Sub_Category
from store.models import Product, MarketingImages
from blog.models import BlogPost
from contact.models import Socials

now = timezone.now()
today = timezone.now().date()

def home (request):
    women = Category.objects.filter(slug = 'office').first()
    men = Category.objects.filter(slug = 'outdoor').first()
    kids = Category.objects.filter(slug = 'home-decor').first()
    baby = Category.objects.filter(slug = 'interior').first()
    sofa = Category.objects.filter(slug = 'sofa').first()
    
    women = Product.objects.filter(category_id = women.id).all()[:8]
    men = Product.objects.filter(category_id = men.id).all()[:8]
    kids = Product.objects.filter(category_id = kids.id).all()[:8]
    baby = Product.objects.filter(category_id = baby.id).all()[:8]
    sofa = Product.objects.filter(category_id = sofa.id).all()[:8]
    
    flash_sales = Product.objects.filter(flash_sales=True).all()
    in_store_offers  = Product.objects.filter(in_store_offers=True).all()
    most_viewed = Product.objects.filter(most_viewed=True).all()
    new_arrival = Product.objects.filter(new_arrival=True).all()
    color_your_world = Product.objects.filter(color_your_world=True).all()
    
    social_urls = Socials.objects.all()

    posts = BlogPost.objects.order_by('-updated_at').all()[:3]

    marketing_on_offers = MarketingImages.objects.filter(on_offer = True).order_by('-updated_at').all()[:3]
    marketing_new_products = MarketingImages.objects.filter(new_product = True).order_by('-updated_at').all()[:3]
    marketing_large = MarketingImages.objects.filter(large = True).order_by('-updated_at').all()[:1]


    context = {
        'women': women,
        'men' : men,
        'kids' : kids,
        'baby':baby,
        'sofa':sofa,
        
        'flash_sales': flash_sales,
        'in_store_offers':in_store_offers,
        'most_viewed':most_viewed,
        'new_arrival':new_arrival,
        'color_your_world':color_your_world,

        'social_urls':social_urls,

        'marketing_on_offers':marketing_on_offers,
        'marketing_new_products':marketing_new_products,
        'marketing_large':marketing_large
    }

    return render (request, 'home.html', context)