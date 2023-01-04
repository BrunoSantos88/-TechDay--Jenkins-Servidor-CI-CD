pipeline {
  agent any
  tools { 
        maven 'Maven 3.5.2'  
    }
   stages{
    stage('QualityGateSonarTeste') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=-TechDay--Jenkins-Servidor-CI-CD -Dsonar.organization=BrunoSantos -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=700dcb9a79ba7aa525cdf858e19ccf6ad1e59b98'
			}
        } 
  }
}
