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
        stage ('Set terraform path') {
            steps {
                cleanWs()
                checkout scm
            }
        }
        stage ('set terraform path') {
            steps {
                script {
                    env.PATH += ":/usr/local/bin"
                    ansiColor('xterm') {
                        sh 'terraform --version'
                        sh 'pwd'
                        sh 'terraform init'
                    }    
                }  
            }       
        }
    }    
}
