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
         stage('Check credentials') {
             steps {
		 withAWS(region:'us-east-1',credentials:'mihpradh') {
                 sh 'aws sts get-caller-identity'
		 }
             }
         }
         stage('Create Kubernetes cluster in EKS') {
             steps {
		 withAWS(region:'us-east-1',credentials:'mihpradh') {
                 sh '''
                     eksctl create cluster \
                     --name website \
                     --version 1.17 \
                     --region us-east-1 \
                     --nodegroup-name website-nodes \
                     --node-type t2.micro \
                     --nodes 3 \
                     --nodes-min 1 \
                     --nodes-max 4 \
                     --ssh-access \
                     --ssh-public-key capstone.pub \
                     --managed
                 ''' 
		 }
             }
         }
     }
}
