 pipeline {
    agent any 
    stages {
        stage('CloneRepo') {
            steps {
                    bat("""
                    git clone https://github.com/RazvanFlorea28/projectgit.git
                    echo "pulled the code" 
                    """)
            }
        }
    }
}
