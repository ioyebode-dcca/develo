// Jenkinsfile
def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awsCredentials']]

pipeline {
    agent any
    stages {
        stage ('one') {
	    steps {
            cleanWs()
	    checkout scm
	    }
	}
        stage ('Set Terraform path') {
            steps {
                script {
                    env.PATH += ":/usr/local/bin/"
                    ansiColor('xterm') {
                        sh 'terraform --version'
                    }
                }
            }
        }
        stage ('Terraform init') {
            steps {
                script {
                 // withCredentials(awsCredentials)
                    dir('.')
                    env.PATH += ":/usr/local/bin/"
                    ansiColor('xterm') {
                        sh 'pwd'
                        sh 'terraform init -input=false'
                    }
                }
            }
        }
    }
}
