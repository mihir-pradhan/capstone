pipeline {
     agent any
     stages {
         stage('Linting') {
             steps {
                 sh 'tidy -q -e *.html'
             }
         }
         stage('Build image') {
              steps {
       		 sh 'sudo ./run_docker.sh'
              }
         }
         stage('Push image') {
              steps {
                 sh './upload_docker.sh'
              }
         }
     }
}
