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
            when { branch 'app1'}
             steps  {
                 echo 'step up'
             }
         }
        }

         stage ('deploy') {
             steps  {
               withCredentials([file(credentialsId: 'PRIVATE_KEY', variable: 'KEY')]) {
                 echo  'deploy'

                 sh 'file KEY'
                 sh "ssh -i \$KEY ec2-userp@172.31.10.85 sh -c 'hostname; exit'"
              }

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
