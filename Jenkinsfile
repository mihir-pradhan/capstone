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
                      dockerImage = docker.build registry + ":v1"
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
         stage('Check credentials') {
             steps {
		 withAWS(region:'us-east-1',credentials:'mihpradh') {
                 sh 'aws sts get-caller-identity'
		 }
             }
         }
        stage('Apply Kube config') {
             steps {
                 withAWS(region:'us-east-1',credentials:'mihpradh') {
                 sh '/home/ubuntu/run_kubernetes.sh'
                 }
             }
         }
     }
}
