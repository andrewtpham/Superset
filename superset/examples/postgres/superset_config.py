import os

MAPBOX_API_KEY = 'pk.eyJ1IjoiYXNzdmluIiwiYSI6ImNqaHVtYXhkNzBsdDgzcnFrM3B5c2o0N2UifQ.v6pL0LHkIu3PeBAWttPdhg'
CACHE_CONFIG = {
    'CACHE_TYPE': 'redis',
    'CACHE_DEFAULT_TIMEOUT': 300,
    'CACHE_KEY_PREFIX': 'superset_',
    'CACHE_REDIS_HOST': 'redis',
    'CACHE_REDIS_PORT': 6379,
    'CACHE_REDIS_DB': 1,
    'CACHE_REDIS_URL': 'redis://redis:6379/1'}
SQLALCHEMY_DATABASE_URI = \
    'postgresql+psycopg2://superset:superset@postgres:5432/superset'
SQLALCHEMY_TRACK_MODIFICATIONS = True
SECRET_KEY = 'thisISaSECRET_1234'
HTTP_HEADERS = {}
UPLOAD_FOLDER='/tmp/'
WTF_CSRF_EXEMPT_LIST = ['http://localhost:8080']
