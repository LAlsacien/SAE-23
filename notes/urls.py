
from django.urls import path, include
from . import views

urlpatterns = [
    path('ajoutetudiant/',views.ajoutetudiant, name='ajoutetudiant'),
    path('ajoutnote/',views.ajoutnote, name='ajoutnote'),
    path('ajoutenseignant/',views.ajoutenseignant, name='ajoutenseignant'),
    path('ajoutue/',views.ajoutue, name='ajoutue'),
    path('ajoutexamen/',views.ajoutexamen, name='ajoutexamen'),
    path('ajoutressourceue/',views.ajoutressourceue, name='ajoutressourceue'),
    path('notes/', views.notes, name='notes'),
    path('etudiants/', views.etudiants, name='etudiants'),
    path('affichenote/<notes_etudiant>/', views.affichenote, name='affiche-note'),
]