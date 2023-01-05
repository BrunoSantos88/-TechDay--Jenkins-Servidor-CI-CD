pipeline
{ agent { docker { image 'mven:3.5.2'
} }
stages {
stage('log version info') {
steps {
sh 'mvn --version'
sh 'mvn clean install'
}
}
}
}
