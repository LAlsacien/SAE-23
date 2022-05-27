# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Enseignants(models.Model):
    nom = models.CharField(max_length=255, blank=True, null=True)
    prenom = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'enseignants'

    def __str__(self):
        return self.nom + " " + self.prenom


class Etudiants(models.Model):
    numeroetudiant = models.BigIntegerField(db_column='numeroEtudiant', blank=True, null=True)  # Field name made lowercase.
    nom = models.CharField(max_length=255, blank=True, null=True)
    prenom = models.CharField(max_length=255, blank=True, null=True)
    groupe = models.BigIntegerField(blank=True, null=True)
    photo = models.TextField(blank=True, null=True)
    email = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'etudiants'

    def __str__(self):
        return self.nom + " " + self.prenom


class Examens(models.Model):
    titre = models.CharField(max_length=255, blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    coefficient = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'examens'
    
    def __str__(self):
        return self.titre


class Notes(models.Model):
    examens = models.ForeignKey(Examens, models.DO_NOTHING, db_column='examens', blank=True, null=True)
    etudiant = models.ForeignKey(Etudiants, models.DO_NOTHING, db_column='etudiant', blank=True, null=True)
    note = models.BigIntegerField(blank=True, null=True)
    appreciation = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'notes'
    
    def __str__(self):
        return "Note de " + self.etudiant.nom + " " + self.etudiant.prenom + " à l'examen de " + self.examens.titre


class Ressourcesue(models.Model):
    coderessource = models.IntegerField(db_column='codeRessource', blank=True, null=True)  # Field name made lowercase.
    ue = models.ForeignKey('Ue', models.DO_NOTHING, db_column='nom', blank=True, null=True)
    descriptif = models.CharField(max_length=255, blank=True, null=True)
    coefficient = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ressourcesUe'

    def __str__(self):
        return self.coderessource


class Ue(models.Model):
    code = models.IntegerField(blank=True, null=True)
    nom = models.CharField(max_length=255, blank=True, null=True)
    semestre = models.IntegerField(blank=True, null=True)
    ects = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ue'

    def __str__(self):
        return self.nom
