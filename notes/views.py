from django.shortcuts import render
from django.http import HttpResponseRedirect
from .forms import EtudiantsForm
from .models import Etudiants

def index(request): 
    submitted = False
    if request.method == "POST":
        form = EtudiantsForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/")
    else: 
        form = EtudiantsForm()
        if 'submitted' in request.GET:
            submitted = True
    
    return render(request, 'index.html', {'form': form})

