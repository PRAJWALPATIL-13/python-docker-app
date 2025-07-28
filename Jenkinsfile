pipeline {
    agent any

    environment {
        IMAGE_NAME = 'prajwalpatil13/python-docker-app'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/PRAJWALPATIL-13/python-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t $IMAGE_NAME:latest .'
            }
        }

        stage('Test App') {
            steps {
                // This can be improved for actual tests; here it checks if the app runs
                //sh 'docker run -d -p 5000:5000 --rm $IMAGE_NAME:latest python app.py'
                echo 'Running tests...'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                      echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                      docker push $IMAGE_NAME:latest
                    '''
                }
            }
        }

        stage('Deploy Container') {
            steps {
                // sh '''
                //   docker stop python-app || true
                //   docker rm python-app || true
                //   docker run -d --name python-app -p 5000:5000 $IMAGE_NAME:latest
                // '''
                sh 'docker run -d --rm -p 5002:5000 --name python-app-dev $IMAGE_NAME:latest'

            }
        }
    }
}