pipeline {
    agent any


    tools {
     maven 'MAVEN_HOME'
    }

    options{
         buildDiscarder(logRotator(numToKeepStr: '5'))
        disableConcurrentBuilds()
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                echo "M2_HOME= ${M2_HOME}"
                sh 'java -version'
            }
        }

        stage('create image ') {
            steps {
                sh 'docker build -t tombostone/myproject:0.0.1 .'
            }
        }
        
         stage('push image ') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                    sh "docker login -u tombostone -p ${dockerHubPwd}"
             }
                sh 'docker push tombostone/myproject:0.0.1'
            }
        }
        
         stage('Run image ') {
            steps {
               //  def dockerRun = 'docker run -d -p 8080:8080 --name my-app tombostone/myproject:0.0.1'
               sshagent(['dev-server']) {
                   sh "ssh -o StrictHostKeyChecking=no ec2-user@35.180.211.247 ${dockerRun} "
                }
            }
        }
    }
}

