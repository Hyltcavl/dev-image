# WSL Dev Image

This repo contains the developer image i use as a WSL distro.

You can make the docker image in to a WSL distro by doing the following:

* Build the image
''' bash
docker build -t dev-image:latest .
'''
* Validate that the image was created
''' bash
docker images
'''
* Validate that the image works
''' bash
docker run -it dev-image:latest
'''
* Create a container from the image
''' bash
docker create --name dev-image-container dev-image:latest
'''
* Export the container to a tar file
''' bash
docker export dev-image-container -o dev-image-tar.tar
'''
* You might need to remove a old distro with the same name
''' bash
wsl --unregister dev-image
'''

* Import the tar file to a WSL distro
''' bash
wsl --import dev-image C:\wsl.localhost\ .\dev-image-tar.tar --version 2
'''
* If you want to, set the WSL distro as the default
''' bash
wsl --set-default dev-image OR wsl -d dev-image --user dev
'''
* Start the WSL distro
''' bash
wsl -d dev-image  
'''

TODO:

* Maven installation not working
