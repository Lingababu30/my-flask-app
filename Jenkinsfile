pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        IMAGE_NAME = "lingababu30/flaskapp"
    }
    stages {
        stage('Checkout Code') {
            steps {
                echo "Checking out source code..."
                git branch: 'main',
                    credentialsId: 'github-credentials',
                    url: 'https://github.com/Lingababu30/my-flask-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME:latest .'
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        sh 'echo $PASS | docker login -u $USER --password-stdin'
                    }
                }
            }
        }
        stage('Push Image to Docker Hub') {
            steps {
                script {
                    sh 'docker push $IMAGE_NAME:latest'
                }
            }
        }
    }
    post {
        failure {
            echo "❌ Build failed. Check logs."
        }
        success {
            echo "✅ Docker image pushed successfully!"
        }
    }
}
