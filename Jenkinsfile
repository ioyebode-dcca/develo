// Jenkinsfile
String credentialsId = 'awsCredentials'

try {
  stage('checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }


  // Run terraform init
  stage('init') {
    node {
    env.PATH += ":/usr/local/bin/"
      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: credentialsId,
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
          sh 'terraform init'
        }
      }
    }
  }


  // Run terraform plan
  stage('plan') {
    node {
    env.PATH += ":/usr/local/bin/"
      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: credentialsId,
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
          sh 'terraform plan -out=plan'
        }
      }
    }
  }

  if (env.BRANCH_NAME == 'master') {

   // Run terraform apply
    stage('apply') {
      node {
      env.PATH += ":/usr/local/bin/"
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: credentialsId,
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
 //           sh 'terraform apply plan'
          }
        }
      }
    }

    // Run terraform destroy
    stage('destroy') {
      node {
      env.PATH += ":/usr/local/bin/"
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: credentialsId,
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
            sh 'terraform destroy -force'
          }
        }
      }
    }
  withEnv(["ARTIFACT_URL=${artifactUrl}", "APP_NAME=${pom.artifactId}"]) {
  echo "The URL is ${env.ARTIFACT_URL} and the app name is ${env.APP_NAME}"

  // install galaxy roles
  sh "ansible-galaxy install -vvv -r provision/requirements.yml -p provision/roles/"       

  ansiblePlaybook colorized: true,
  credentialsId: 'ec2-user',
  limit: "${HOST_PROVISION}",
  installation: 'ansible',
  inventory: 'provision/inventory.ini',
  playbook: 'provision/playbook.yml',
  sudo: true,
  sudoUser: 'jenkins'
}
  }
  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}
