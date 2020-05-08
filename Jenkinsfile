pipeline {
    agent any
    
    tools {
     maven 'MAVEN_HOME'
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -version'
            }
        }
        stage('Test') {
            steps {
                echo 'M2_HOME= ${M2_HOME}'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
