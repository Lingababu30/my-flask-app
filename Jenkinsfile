pipeline {
    agent any
    environment {
        IMAGE_NAME = "lingababu30/flaskapp"
    }
    stages {
        stage('Checkout Code') {
            steps {
                echo "📦 Checking out source code..."
                git branch: 'main',
                    url: 'https://github.com/Lingababu30/my-flask-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image..."
                bat 'docker build -t %IMAGE_NAME%:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                echo "🔑 Logging into Docker Hub..."
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    bat 'echo %PASS% | docker login -u %USER% --password-stdin'
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                echo "⬆️ Pushing Docker image to Docker Hub..."
                bat 'docker push %IMAGE_NAME%:latest'
            }
        }
    }
    post {
        success {
            echo "✅ Build and push successful! Image available at Docker Hub: %IMAGE_NAME%:latest"
        }
        failure {
            echo "❌ Build failed. Check logs for details."
        }
    }
}
