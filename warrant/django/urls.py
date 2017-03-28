from django.conf.urls import url
from .views import ProfileView,UpdateProfileView,MySubsriptions

urlpatterns = (
    url(r'^profile/$', ProfileView.as_view(),name='profile'),
    url(r'^profile/update/$', UpdateProfileView.as_view(),name='update-profile'),
    url(r'^profile/subscriptions/$', MySubsriptions.as_view(),name='subscriptions')
)