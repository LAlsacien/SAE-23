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
            labels = {"numero":"Numéro étudiant"}