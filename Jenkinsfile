pipeline {
    agent any

    stages {
         stage ('Checking Deploy tool and initial cleanup') {
             steps {
                 sh 'mvn --version'
                 sh 'java -version'
                 sh ' git --version'
             }
         }

         stage ('compile and test code') {
             steps  {
                 sh 'mvn clean install'
             }
         }
         stage ('deploy code to App Server') {
            when {
                branch 'develop'
            }
             steps  {
                 echo  'deployed'
                 sh 'cp /tmp/key.pem jenkinskey4.pem && chmod 400  jenkinskey4.pem'
                 sh 'scp -i  jenkinskey3.pem -o StrictHostKeyChecking=no target/SampleServlet.war  ec2-user@172.31.12.75:/var/lib/tomcat/webapps'
             }
        }
        stage ('Test environment on App Server') {
            when {
                branch 'develop'
            }
             steps  {
                sleep 5
                sh 'curl http://ec2-54-171-58-130.eu-west-1.compute.amazonaws.com/app1 | grep Landing'
             }
        }

        // do some app test to make sure it works  and then deplo yo prod
        stage ('deploy to stage') {
        when {
                branch 'develop'
            }
             steps  {
                 echo  'complete'
            }
        }

        stage ('complete') {
             steps  {
                 echo  'complete'
            }
        }

    }
    post {
            always {
                sh 'rm -rf *'
            }
        }
    
}
