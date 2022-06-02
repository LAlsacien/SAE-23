from django.shortcuts import render
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