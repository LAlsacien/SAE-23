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
from django.http import FileResponse
import io 





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

def supprnotes(request, notes_id):
    notes = models.Notes.objects.get(pk=notes_id)
    notes.delete()
    return redirect('etudiants')

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

def ressourceue(request):
    ressourceue = Ressourcesue.objects.all()
    return render(request, 'ressourceue.html', {'ressourceue': ressourceue})

def supprressourceue(request, ressourceue_id):
    ressourceue = models.Ressourcesue.objects.get(pk=ressourceue_id)
    ressourceue.delete()
    return redirect('ressourceue')

def ue(request):
    ue = Ue.objects.all()
    return render(request, 'ue.html', {'ue': ue})

def supprue(request, ue_id):
    ue = models.Ue.objects.get(pk=ue_id)
    ue.delete()
    return redirect('ue')

# def notepdf(request, notes_id):
#     notes = Notes.objects.get(pk=notes_id)
#     response = HttpResponse(content_type='application/pdf')
#     response['Content-Disposition'] = 'attachment; filename="notes.pdf"'
#     p = canvas.Canvas(response)
#     p.setFont("Helvetica", 20)
#     p.drawString(100, 800, "Notes")
#     p.setFont("Helvetica", 15)
#     p.drawString(100, 750, "Nom etudiant : " + notes.etudiant.nom)
#     p.drawString(100, 725, "Prenom etudiant : " + notes.etudiant.prenom)
#     p.drawString(100, 700, "Note 1 : " + str(notes.note1))
#     p.drawString(100, 675, "Note 2 : " + str(notes.note2))
#     p.drawString(100, 650, "Note 3 : " + str(notes.note3))
#     p.drawString(100, 625, "Note 4 : " + str(notes.note4))
#     p.drawString(100, 600, "Note 5 : " + str(notes.note5))
#     p.drawString(100, 575, "Moyenne : " + str(notes.moyenne))
#     p.drawString(100, 550, "Note finale : " + str(notes.note_finale))
#     p.drawString(100, 525, "Mention : " + notes.mention)
#     p.save()
#     return response

# def notepdf(request):
#     buf = io.BytesIO()
#     c = canvas.Canvas(buf, pagesizes=letter, bottomup=0)
#     textob = c.beginText()
#     textob.setTextOrigin(inch, inch)
#     textob.setFont("Helvetica", 14)
#     lines = [
#         "This is line 1",
#         "This is line 2",
#         "This is line 3",
#     ]

#     for line in lines:
#         textob.textLine(line)

#     c.drawText(textob)
#     c.showPage()
#     c.save()
#     buf.seek(0)

#     return FileResponse(buf, as_attachment=True, filename='notes.pdf')