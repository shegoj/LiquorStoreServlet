pipeline {
    agent any

    stages {
         stage ('Checking Deploy tool') {
             steps {
                 sh 'mvn --version'
                 sh 'java -version'
                 sh ' git --version'
             }
         }

         stage ('pull down codbase') {
           timeout (10, unit:'MINUTES') {
            when { branch 'app1'}
             steps  {
                 echo 'step up'
             }
         }
        }

         stage ('deploy') {
             steps  {
                 echo  'deploy'
             }
        }
        stage ('complete') {
             steps  {
                 echo  'completed'
            }
        }
    }

}
