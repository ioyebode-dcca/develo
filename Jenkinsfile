// Jenkinsfile
String credentialsId = 'awsCredentials'
pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
		cleanWs()
                checkout scm
            }
        }
        stage('Set Terraform path') {
            steps {
                script {
                    env.PATH += ":/usr/local/bin/"
                }
                sh 'terraform --version'
		sh 'pwd'
            }
        }
	stage('version') {
            steps {
	      input ('Do you want to proceed?')	    
                sh """
                git --version
                mvn -version
                uptime
                env
                ls -ltr
                """
            }
        }    
        stage('Terraform Init') {
            steps {
                dir('.') {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: credentialsId,
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                    ]]) {
                        ansiColor('xterm'){
                            sh 'pwd'
                            sh 'terraform init'
                            sh 'terraform plan -out=tfplan'
                        }
                    }
                }
            }
        }
	stage ('check plan') {
            steps {
              input('Is terraform plan okay?')
            }
        } 
	stage(Ansible version) {
            steps {
                sh """
                ansible --version
                """
            }  
        }   
    }
}
