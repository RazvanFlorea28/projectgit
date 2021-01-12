pipeline {
    agent any 
    stages {
        stage("Testing webserver1 ports and services"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    bat ("""
                    vagrant ssh webserver1 -c "cd /vagrant && ./testweb.sh"
                    """)
               }
           }
       }
        stage("Testing webserver2 ports and services"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    bat ("""
                    vagrant ssh webserver2 -c "cd /vagrant && ./testweb.sh"
                    """)
               }
           }
       }
        stage("Testing nginx ports, services and sample web pages load balancing"){
           steps { 
               dir('C:\\project\\new\\projectgit'){
                    bat ("""
                    vagrant ssh nginx -c "cd /vagrant && ./testnginx.sh"
                    """)
               }
           }
       }
    }
}
