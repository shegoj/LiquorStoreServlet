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
  }
}
