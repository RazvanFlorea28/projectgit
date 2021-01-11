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
    }
}
