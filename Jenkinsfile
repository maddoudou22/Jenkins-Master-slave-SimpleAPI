pipeline {
    agent any
	
    stages {
        stage('Build') {
            steps {
                echo 'Building in the snapshot repo ...'
				sh 'pwd' 
				sh 'mvn clean package -DtargetRepo /root/repositories/API-javaSpringboot_local/snapshot/'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
				sh 'ls /root/repositories/API-javaSpringboot_local/snapshot/API-javaSpringboot*'
            }
        }
        stage('Clean') {
            steps {
                echo 'Cleaning ...'
				sh 'rm /root/target/API-javaSpringboot*.jar'
            }
        }
    }
}