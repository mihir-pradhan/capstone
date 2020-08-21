pipeline {
     agent any
     stages {
         stage('Linting') {
             steps {
       		 sh 'hadolint Dockerfile'
             }
         }
         stage('Build image') {
              steps {
       		 sh './run_docker.sh'
              }
         }
         stage('Push image') {
              steps {
              }
         }
         stage('set current kubectl context') {
              steps {
              }
         }
         stage('Deploy container') {
              steps {
              }
         }
     }
}
