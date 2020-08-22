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
        stage('Apply Kube config') {
             steps {
                 sh '''
                 aws eks --region us-east-1 update-kubeconfig --name website
                 arn=$(aws eks describe-cluster --name website | grep -Po '"arn": *\K"[^"]*"' | sed 's/"//g')
                 kubectl config use-context $arn
                 kubectl get svc
                 kubectl apply -f deployment.yaml
                 kubectl get deployments
                 kubectl apply -f service.yaml
                 kubectl get services
                 kubectl get pods -o wide
		 '''
             }
         }
     }
}
