This project consists of a small setup containing 2 Apache web servers, deployed automatically using Vagrant and provisioned using Ansible, along with a Nginx docker container which resides on a server deployed and provisioned using Vagrant. The launching of the whole is done via a Jenkins pipeline, which contains in its last stages, a verification of the created environment: ensures that the relevant services and ports are open, and nginx balancing is performed as expected.
The assumption is that Vagrant and Virtual Box will run on a local Windows host, along with Jenkins, while the above mentioned servers (2 Apache web servers, and 1 Nginx) are hosted on CentOS 7. 
In order to be able to use this setup, the following list of prerequisites need to exist:
Prerequisites:
 - GIT installed;
 - Jenkins installed and configured to run with the Windows logged in user;
 - Jenkins pipeline configuration to use JenkinsFile from git:https://github.com/RazvanFlorea28/projectgit.git;
 - Virtual Box installed, latest version;
 - Vagrant installed; 
 - Internet connectivity for all the servers, including the VMs