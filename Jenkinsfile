// Jenkinsfile
//def awsCredentials = [[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'awsCredentials']]
String credentialsId = 'awsCredentials'
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
                //withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: credentialsId, accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                withCredentials('$AWS_ACCESS_KEY_ID')
                //withCredentilas('$AWS_SECRET_ACCESS_KEY')
                script {
                    env.PATH += ":/usr/local/bin"
                    //withCredentials($AWS_ACCESS_KEY_ID')
                    //withCredentials($AWS_SECRET_ACCESS_KEY')
                    ansiColor('xterm') {
                        sh 'terraform --version'
                        sh 'pwd'
                        sh 'ls'
                        sh 'terraform init'
                        sh 'terraform plan'
                    }    
                }  
            }       
        }
    }    
}
