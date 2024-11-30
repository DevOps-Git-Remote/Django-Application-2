from django.shortcuts import render


def home(request):
    return render(request,'index.html')


def about(request):
    return render(request,'about.html')


def service(request):
    return render(request,'service.html')


def blog(request):
    return render(request,'blog.html')


def feature(request):
    return render(request,'feature.html')