pipeline {
  agent any
  tools { 
        maven 'Maven 3.5.2'  
    }
   stages{
    stage('CompileandRunSonarAnalysis') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=-TechDay--Jenkins-Servidor-CI-CD -Dsonar.organization=BrunoSantos -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=f44ed562c95910a7f7f5e069d86cdd6415146d6d'
			}
        } 
  }
}
