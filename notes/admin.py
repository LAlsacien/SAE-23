from django.contrib import admin
from .models import Enseignants, Etudiants, Ue, Examens, Notes, Ressourcesue


admin.site.register(Etudiants)
admin.site.register(Enseignants)
admin.site.register(Ue)
admin.site.register(Examens)
admin.site.register(Notes)
admin.site.register(Ressourcesue)
