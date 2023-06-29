from django.contrib.messages import constants as messages
from pathlib import Path

import os
import pymysql

pymysql.version_info = (1, 4, 6, 'final', 0)
pymysql.install_as_MySQLdb()

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = '8a1*)dg=h4u^2u0u*8xuuh2ani&imko&-a5wj!hiwdw7j2-&61'

DEBUG = False


ALLOWED_HOSTS = [
    '127.0.0.1:8000',
    '127.0.0.1',
    'sipssolutions.co.ke',
    'https://sipssolutions.co.ke/',
    'localhost',
    'www.sipssolutions.co.ke',
]


INSTALLED_APPS = [
    # Common Apps
    # 'jazzmin',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'django.contrib.humanize',
    # allauth
    # 'django.contrib.sites',
    # 'allauth',
    # 'allauth.account',
    # 'allauth.socialaccount',
    # 'allauth.socialaccount.providers.google',

    # Installed Apps
    'accounts',
    'category',
    'store',
    'subcategory',
    'carts',
    'order',
    'mpesa_api',
    'contact',
    'blog',

    # TEXT RICH
    # 'tinymce',
    'ckeditor'
]

MIDDLEWARE = [
    # WHITENOISE
    'whitenoise.middleware.WhiteNoiseMiddleware',

    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',

]

ROOT_URLCONF = 'UrbanTwo.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'carts.context_processors.counter',
            ],
        },
    },
]

WSGI_APPLICATION = 'UrbanTwo.wsgi.application'

AUTH_USER_MODEL = 'accounts.Account'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'sips_furniture',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'sipssolutions_sips_solutions',
#         'USER': 'sipssolutions_sips_solutions',
#         'PASSWORD': 'Lux3D3co@#$',
#         'HOST':'localhost',
#         'PORT':'3306',
#     }
# }

# Password validation
# https://docs.djangoproject.com/en/3.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Africa/Nairobi'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)

STATIC_ROOT = BASE_DIR / 'static'
STATIC_URL = '/static/'
STATICFILES_DIRS = [
    'UrbanTwo/static',
]


DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# MEDIA FILES
MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'

MESSAGE_TAGS = {
    messages.ERROR: 'danger',
}

# SMTP Configurations
EMAIL_HOST = 'mail.sipssolutions.co.ke'
EMAIL_PORT = 465
# EMAIL_USE_TLS = True
EMAIL_USE_SSL = True
EMAIL_HOST_USER = 'noreply@sipssolutions.co.ke'
EMAIL_HOST_PASSWORD = 'p9FI8KT1A3DY'
