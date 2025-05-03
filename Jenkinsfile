pipeline {
  agent any

  environment {
    DOCKERHUB_CREDENTIALS = credentials('DOCKER_HUB_CREDENTIAL')
  //  VERSION = "${env.BUILD_ID}"

  }

  tools {
    maven "Maven"
  }

  stages {

    stage('Maven Build'){
        steps{
        sh 'mvn clean package  -DskipTests'
        }
    }
	
    stage('Docker Build and Push') {
      steps {
          sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
          sh 'docker build -t sumit30/sbFirst-v1.'
          sh 'docker push sumit30/sbFirst-v1'
      }
    } 
     stage('Deploy') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh 'docker stop sbFirst || true'
                    sh 'docker rm sbFirst || true'
                    
                    // Run new container
                    sh """
                    docker run -d \
                    --name sbFirst \
                    -p 8080:8080 \
                     sbFirst-v1
                    """
                }
            }
        }
    }

     stage('Cleanup Workspace') {
      steps {
        deleteDir()
       
      }
    }
  }



