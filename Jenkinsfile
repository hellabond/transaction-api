pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/hellabond/Transaction.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t transaction-api:latest .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 8081:8080 transaction-api:latest'
            }
        }
    }
}