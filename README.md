LinuxPatchManagement Tutorial
=============================

Introduction
------------

LinuxPatchManagement is a solution that allows you to manage the patch deployment process for your Linux systems. It uses a Docker-based architecture to provide a scalable and reliable solution.

Getting Started
---------------

To get started with LinuxPatchManagement, you will need to:

1.  Install Docker.
2.  Clone the LinuxPatchManagement repository.
4.  Create 2 Folders to store Patches: /apt & /yum
3.  Run `docker-compose up -d` to start the services.

Once the services are started, you will be able to access the mirrors at:

-   Debian mirror: http://localhost:8080
-   CentOS mirror: http://localhost:8081/repos

Using LinuxPatchManagement
--------------------------

To use LinuxPatchManagement, you will need to:

1.  Update the source list of the clients by the new URL correspending to the OS.
    * For Debian: update the file /etc/apt/sources.list
    * For Centos : Create a new file  under /etc/yum.repos.d/ 
2.  Start the update/install of desired packages.


*****************************

<sub> Edited by Zied BEN SALEM - </sub>