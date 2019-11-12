// Jenkinsfile
parameters credentialsId = 'awsCredentials'

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
                  withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: credentialsId, accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                    dir('develo')
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
