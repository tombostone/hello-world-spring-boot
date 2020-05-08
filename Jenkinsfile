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
                sh 'mvn -version'
            }
        }
        stage('Test') {
            steps {
                echo "M2_HOME= ${M2_HOME}"
                sh 'java -version'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
