from .models import Etudiants, Ue, Enseignants, Examens, Notes, Ressourcesue
from django import forms
from . import models
from django.forms import ModelForm
from django.utils.translation import gettext_lazy as _


class EtudiantsForm(ModelForm):
        class Meta:
            model = Etudiants
            fields = (
                'numeroetudiant',
                'nom',
                'prenom',
                'groupe',
                'photo',
                'email',
                )
            labels = {"numeroetudiant":"Numéro étudiant :", "nom":"Nom :", "prenom":"Prénom :", "groupe":"Groupe :", "photo":"Photo :", "email":"E-mail :"}


class NotesForm(ModelForm):
        class Meta:
            model = Notes
            fields = (
                'examens',
                'etudiant',
                'note',
                'appreciation',
            )

class UeForm(ModelForm):
        class Meta:
            model = Ue
            fields = (
                'code',
                'nom',
                'semestre',
                'ects',
            )

class EnseignantsForm(ModelForm):
        class Meta:
            model = Enseignants
            fields = (
                'nom',
                'prenom',
            )

class ExamensForm(ModelForm):
        class Meta:
            model = Examens
            fields = (
                'titre',
                'date',
                'coefficient',
            )

class RessourcesueForm(ModelForm):
        class Meta:
            model = Ressourcesue
            fields = (
                'coderessource',
                'ue',
                'descriptif',
                'coefficient',
            )
            labels = {"coderessource":"Code de la ressource :", "ue":"UE à laquelle la ressource appartient:", "descriptif":"Nom complet :"}
