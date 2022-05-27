from django.shortcuts import render
from django.http import HttpResponseRedirect
# from .forms import EtudiantForm
# from .models import Etudiant

def index(request):
    submitted = False
    if request.method == "POST":
        form = EtudiantForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect("/")
    else: 
        form = EtudiantForm()
        if 'submitted' in request.GET:
            submitted = True
    
    return render(request, 'index.html', {'form': form})

