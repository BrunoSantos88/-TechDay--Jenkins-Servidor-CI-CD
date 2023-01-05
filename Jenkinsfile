pipeline {
    agent none

    stages {

        stage ('docker build') {
            agent any

            steps {
                echo 'Hello, '

                sh '''

                docker build -t .


                '''
            }
        }
    }
}
