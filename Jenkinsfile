// Jenkinsfile
def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awsCredentials']]
pipeline {
    agent any
    stages {
        stage('Example') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
