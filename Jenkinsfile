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
  }
}
