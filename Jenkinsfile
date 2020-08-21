pipeline {
     environment {
    	registry = "mihirpradhan/website"
    	registryCredential = 'dockerhub'
	dockerImage = ''
     }
     agent any
     stages {
         stage('Linting') {
             steps {
                 sh 'tidy -q -e *.html'
             }
         }
         stage('Build image') {
              steps {
                   script {
                      dockerImage = docker.build registry + ":$BUILD_NUMBER"
                   }
              }
         }
         stage('Push image') {
              steps {
                   script {
                      docker.withRegistry( '', registryCredential ) { 
                      dockerImage.push() 
	       	      }
                  }
              }
         }
     }
}
