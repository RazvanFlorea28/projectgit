pipeline {
    agent any 
    stages {
        stage('CloneRepo') {
            steps {
             dir('C:\\project\\new'){
                    bat("""
                    git clone https://github.com/RazvanFlorea28/projectgit.git
                    echo "pulled the code" 
                    """)
             }
            }
        }
       stage("Creating VMs and provisiong using Vagrant and Ansible"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    echo 'Execute Vagrant up'
                     bat "vagrant up webserver1"
               }
           }
       }
    }
}
