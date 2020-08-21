pipeline {
     environment {
    	registry = "mihirpradhan/website"
    	registryCredential = 'dockerhub'
	dockerImage = ''
     }
     agent {
	dockerfile true
     }
     stages {
         stage('Linting') {
             steps {
                 sh 'tidy -q -e *.html'
             }
         }
         stage('Build image') {
              steps {
		 dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
         }
         stage('Push image') {
              steps {
                 docker.withRegistry( '', registryCredential ) { 
                 dockerImage.push() 
		 }
              }
         }
     }
}
