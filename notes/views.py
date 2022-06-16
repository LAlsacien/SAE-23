from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from .forms import EtudiantsForm
from .forms import NotesForm
from .forms import UeForm
from .forms import ExamensForm
from .forms import EnseignantsForm
from .forms import RessourcesueForm
from .models import Etudiants, Notes, Ue, Examens, Ressourcesue, Enseignants
from . import models 



def index(request):
    return render(request, 'index.html')

def ajoutetudiant(request): 
    submitted = False
    if request.method == "POST":
        form = EtudiantsForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("../ajoutetudiant/")
    else: 
        form = EtudiantsForm()
        if 'submitted' in request.GET:
            submitted = True
    
    return render(request, 'ajoutetudiant.html', {'form': form})


def ajoutnote(request): 
    submitted = False
    if request.method == "POST":
        form = NotesForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("../ajoutnote/")
    else: 
        form = NotesForm()
        if 'submitted' in request.GET:
            submitted = True
    
    return render(request, 'ajoutnote.html', {'form': form})


def ajoutue(request): 
    submitted = False
    if request.method == "POST":
        form = UeForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("../ajoutue/")
    else: 
        form = UeForm()
        if 'submitted' in request.GET:
            submitted = True
    
    return render(request, 'ajoutue.html', {'form': form})


def ajoutexamen(request): 
    submitted = False
    if request.method == "POST":
        form = ExamensForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("../ajoutexamen/")
    else: 
        form = ExamensForm()
        if 'submitted' in request.GET:
            submitted = True
    
    return render(request, 'ajoutexamen.html', {'form': form})


def ajoutenseignant(request): 
    submitted = False
    if request.method == "POST":
        form = EnseignantsForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("../ajoutenseignant/")
    else: 
        form = EnseignantsForm()
        if 'submitted' in request.GET:
            submitted = True
    
    return render(request, 'ajoutenseignant.html', {'form': form})


def ajoutressourceue(request): 
    submitted = False
    if request.method == "POST":
        form = RessourcesueForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("../ajoutressourceue/")
    else: 
        form = RessourcesueForm()
        if 'submitted' in request.GET:
            submitted = True
    
    return render(request, 'ajoutressourceue.html', {'form': form})


def notes(request):
    notes = Notes.objects.all()
    return render(request, 'notes.html', {'notes': notes})


def etudiants(request):
    etudiants = Etudiants.objects.all()
    return render(request, 'etudiants.html', {'etudiants': etudiants})
  
def affichenote(request, id):
    notes = Notes.objects.filter(etudiant__id=id)
    return render(request, 'affichenote.html', {'notes': notes})


def recherche(request):
    if request.method == "POST":
        rechercher = request.POST['rechercher']
        etudiants = Etudiants.objects.filter(prenom__contains=rechercher)
        return render(request, 'recherche.html', {'rechercher':rechercher, 'etudiants': etudiants})
    else:
        return render(request, 'recherche.html')


def editetudiant(request, etudiant_id):
    etudiant = Etudiants.objects.get(pk=etudiant_id)
    form = EtudiantsForm(request.POST or None, request.FILES or None, instance=etudiant)
    if form.is_valid():
        form.save()
        return redirect('etudiants')
    return render(request, 'editetudiant.html', {'etudiant': etudiant, 'form': form})

def suppretudiant(request, etudiant_id):
    etudiant = models.Etudiants.objects.get(pk=etudiant_id)
    etudiant.delete()
    return redirect('etudiants')

def supprnote(request, note_id):
    note = models.Notes.objects.get(pk=note_id)
    note.delete()
    return redirect('notes')

def examens(request):
    examens = Examens.objects.all()
    return render(request, 'examens.html', {'examens': examens})

def supprexamens(request, examens_id):
    examens = models.Examens.objects.get(pk=examens_id)
    examens.delete()
    return redirect('examens')

def enseignants(request):
    enseignants = Enseignants.objects.all()
    return render(request, 'enseignants.html', {'enseignants': enseignants})

def supprenseignants(request, enseignants_id):
    enseignants = models.Enseignants.objects.get(pk=enseignants_id)
    enseignants.delete()
    return redirect('enseignants')