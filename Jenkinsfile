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
                    dir('.')
                    env.PATH += ":/usr/local/bin"
                    //withCredentials('AWS_ACCESS_KEY_ID')
                    //withCredentials('AWS_SECRET_ACCESS_KEY')
                    ansiColor('xterm') {
                        sh 'terraform --version'
                        sh 'pwd'
                        sh 'ls'
                        sh 'terraform init'
                    }    
                }  
            }       
        }
    }    
}
