pipeline {
    agent any
    stages {
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
        stage ('Set Terraform path') {
            steps {
                script {
                    env.PATH += ":/usr/local/bin/" 
                    ansiColor('xterm') {
                        sh 'pwd'
                        sh 'terraform init'
                    }
                }
            }
        } 
    }
}
