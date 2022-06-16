
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
    path('affichenote/<int:id>/', views.affichenote, name='affichenote'),
    path('', views.index, name='index'),
    path('recherche/', views.recherche, name='recherche'),
    path('editetudiant/<etudiant_id>/', views.editetudiant, name='editetudiant'),
    path('suppretudiant/<etudiant_id>/', views.suppretudiant, name='suppretudiant'),
    path('supprnotes/<notes_id>/', views.supprnotes, name='supprnotes'),
    path('examens/', views.examens, name='examens'),
    path('supprexamens/<examens_id>/', views.supprexamens, name='supprexamens'),
    path('enseignants/', views.enseignants, name='enseignants'),
    path('supprenseignants/<enseignants_id>/', views.supprenseignants, name='supprenseignants'),
    path('ressourceue/', views.ressourceue, name='ressourceue'),
    path('supprressourceue/<ressourceue_id>/', views.supprressourceue, name='supprressourceue'),
    path('ue/', views.ue, name='ue'),
    path('supprue/<ue_id>/', views.supprue, name='supprue'),
]