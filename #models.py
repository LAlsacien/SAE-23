from django.db import models


# class Etudiant(models.Model):
#     numero = models.CharField(max_length=5)
#     nom = models.CharField(max_length=100)
#     prenom = models.CharField(max_length=100)
#     groupe = models.CharField(max_length=50)
#     #photo = je sais pas comment faire encore
#     email = models.EmailField(max_length=80)


# class Ue(models.Model):
#     code = models.CharField(max_length=30)
#     nom = models.CharField(max_length=50)
#     semestre = models.CharField(max_length=10)
#     ects = models.CharField(max_length=30)


# class Ressouces(models.Model):
#     code_ressource = models.CharField(max_length=30)
#     nom_ressource = models.CharField(max_length=60)
#     descriptif = models.CharField(max_length=30)
#     coefficient = models.CharField(max_length=10)

# class Enseignants(models.Model):
#     idens = models.CharField(max_length=30)
#     nom = models.CharField(max_length=80)
#     prenom = models.CharField(max_length=80)


# class Examens(models.Model):
#     idex = models.CharField(max_length=4)
#     titre = models.CharField(max_length=30)
#     date = models.DateField(blank=False)
#     coefficient = models.CharField(max_length=2)


# class Notes(models.Model):
#     examen = models.CharField(max_length=30)
#     etudiant = models.CharField(max_length=40)
#     note = models.CharField(max_length=30)
#     appreciation = models.CharField(max_length=1500)


# class Eleve(models.Model):
#     etudiant = models.ForeignKey(Etudiant, on_delete=models.SET_NULL, null=True)
#     ue = models.ForeignKey(Ue, on_delete=models.SET_NULL, null=True)
#     ressources = models.ForeignKey(Ressouces, on_delete=models.SET_NULL, null=True)
#     enseignants = models.ForeignKey(Enseignants, on_delete=models.SET_NULL, null=True)
#     examens = models.ForeignKey(Examens, on_delete=models.SET_NULL, null=True)
#     notes = models.ForeignKey(Notes, on_delete=models.SET_NULL, null=True)