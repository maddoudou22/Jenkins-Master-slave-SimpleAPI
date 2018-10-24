pipeline {
    agent any
	
    stages {
        stage('Build') {
            steps {
                echo 'Building in the snapshot repo ...'
				sh 'pwd' 
				sh 'mvn clean package -DtargetRepo=/var/lib/repositories/API-javaSpringboot_local/snapshot/'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
				sh 'ls /var/lib/repositories/API-javaSpringboot_local/snapshot/API-javaSpringboot*'
            }
        }
        stage('Clean') {
            steps {
                echo 'Cleaning ...'
				//sh 'rm /root/target/API-javaSpringboot*.jar'
            }
        }
    }
}