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
             steps  {
                 sh 'git clone https://github.com/shegoj/LiquorStoreServlet.git codebase'

             }
         }

         stage ('deploy') {
             steps  {
                 echo  'deploy'
             }
        }
        stage ('complete') {
             steps  {
                 echo  'complete'
            }
        }
    }

}
