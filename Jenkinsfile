pipeline {
    agent any
	
	environment {
		dockerRegistry = "maddoudou22/API-javaSpringboot"
		registryCredential = 'dockerhub'
		applicationName = 'API-javaSpringboot'
    }
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
				sh 'ls /var/lib/repositories/API-javaSpringboot_local/snapshot/${applicationName}*'
            }
        }
        stage('Bake') {
            steps {
                echo 'Building Docker image ...'
				//sh 'rm /root/target/API-javaSpringboot*.jar'
            }
        }
		stage('Deploy') {
            steps {
                echo 'Building Docker image ...'
				//sh 'rm /root/target/API-javaSpringboot*.jar'
            }
        }
    }
}