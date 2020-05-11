pipeline {
    agent any


    tools {
     maven 'MAVEN_HOME'
    }

    options{
    buildDiscarder(logRotator(numToKeepStr: '10'))
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
                sh 'docker build -t tombostone/myproject .'
            }
        }
        
         stage('push image ') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                    sh "docker login -u tombostone -p ${dockerHubPwd}"
             }
                sh 'docker push tombostone/myproject'
            }
        }
    }
}

