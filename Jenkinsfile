pipeline {
  agent any
  tools { 
        maven 'Maven 3.5.2'  
    }
   stages{
    stage('CompileandRunSonarAnalysis') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=-TechDay--Jenkins-Servidor-CI-CD --Dsonar.organization=BrunoSantos -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=3a6ebbcf20e61f57cb4d6ccc3d9398d3b99df3bd'
			}
        } 

  
  }
}
