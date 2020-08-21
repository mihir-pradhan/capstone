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
stage(Push image') {
   steps {
       sh './upload_docker.sh'
         }
}
stage('set current kubectl context') {
}
stage('Deploy container') {
}
