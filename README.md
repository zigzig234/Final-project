
# Final-project

Final project for U24!

Basic Idea:

I have made a Docker file, that packages the app.py in apps.

This is ran by the build-push-docker.yml.

A github actions pipeline does linting and security checks on pull requests and then build and pushes the docker container using build-push-docker.yml.

After the image is uploaded to Docker hub, it is automatically deployed onto my kubernetes cluster using argocd, which is synced to the repository as well.

The kubernetes cluster is monitored by telegraf-prometheus-grafana in a monitoring namespace.
