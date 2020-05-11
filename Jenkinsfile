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

        stage('create image & publish to docker hub') {
            steps {
                sh 'mvn clean deploy'
            }
        }
    }


