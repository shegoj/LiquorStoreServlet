pipeline {
  agent any
  stages  {
    stage ('tool verification') {
      steps {
        echo 'verifying needed tool are available'
        sh '''
        mvn -version
        git --version
        kubectl version --client=true
        '''
      }
    }
    stage ('build code') {
      steps {
        sh '''
        echo 'building code'
        mvn clean install
        '''
      }
    }
    stage ('build docker image') {
      steps {
        sh '''
        docker build -t testing .
        '''
      }
    }
    stage ('test container') {
      steps {
       sh '''
       id=$(docker run -p 8082:8080 -d testing)
       curl localhost:8082/SampleServlet/ | grep "Liquor Store" && echo "Test successful"
       echo "deleting container"
       docker rm -f $id
       echo "container deleted.. all is well"
       '''
      }
    }
    stage ('push to docker hub') {
      steps {
        sh '''
        echo "tagging image"
        docker tag testing:latest shegoj/javaapp:v1
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
            echo "pushing container to hub"
            docker login -u $user -p $pass
            docker push shegoj/javaapp:v1
            docker logout
        }
      '''
      }
    }
  }
}
