pipeline {
  agent any
  tools { 
        maven 'Maven 3.8.7'  
    }
  
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t brunosantos88/developerpythonapp:latest .'
      }
    }
}
