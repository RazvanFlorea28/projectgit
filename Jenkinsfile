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
       stage("Creating webserver01 VM and provisiong using Vagrant and Ansible"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    echo 'Execute Vagrant up for webserver1'
                    bat "vagrant up webserver1"
               }
           }
       }
        stage("Creating webserver02 and provisiong using Vagrant and Ansible"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    echo 'Execute Vagrant up for webserver2'
                    bat "vagrant up webserver2"
               }
           }
       }
        stage("Creating nginx and provisiong using Vagrant and Docker"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    echo 'Execute Vagrant up for nginx'
                    bat "vagrant up nginx"
               }
           }
       }
        stage("Testing webserver1 ports and services"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    bat ("""
					vagrant ssh webserver1 -c "cd /vagrant && sed -i -e 's/\r$//' testweb.sh"
                    vagrant ssh webserver1 -c "cd /vagrant && ./testweb.sh"
                    """)
               }
           }
       }
        stage("Testing webserver2 ports and services"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    bat ("""
					vagrant ssh webserver2 -c "cd /vagrant && sed -i -e 's/\r$//' testweb.sh"
                    vagrant ssh webserver2 -c "cd /vagrant && ./testweb.sh"
                    """)
               }
           }
       }
        stage("Testing nginx ports, services and sample web pages load balancing"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    bat ("""
					vagrant ssh nginx -c "cd /vagrant && sed -i -e 's/\r$//' testnginx.sh"
                    vagrant ssh nginx -c "cd /vagrant && ./testnginx.sh"
                    """)
               }
           }
       }
    }
}
