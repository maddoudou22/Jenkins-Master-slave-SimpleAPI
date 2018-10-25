pipeline {
    agent any
	
	environment {
		dockerRegistry = "maddoudou22/API-javaSpringboot"
		registryCredential = 'dockerhub'
		applicationName = 'API-javaSpringboot' // Same as artifactId in pom.xml
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building in the snapshot repo ...'
				sh 'pwd' 
				//sh 'mvn clean package -DtargetRepo=/var/lib/repositories/API-javaSpringboot_local/snapshot/'
				sh 'mvn clean package'
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
				//sh 'rm /root/target/${applicationName}*.jar'
				echo 'Releasing Docker image in Docker registry ...'
				//sh 'rm /root/target/${applicationName}*.jar'
				echo 'Starting to build docker image'
				//sh 'docker build -t maddoudou22/api-javaspringboot:latest .'
				sh 'docker build --build-arg package_version=0.1.0 -t maddoudou22/api-javaspringboot:latest .' 
                //script {
                //    def customImage = docker.build("my-image:${env.BUILD_ID}")
                //    customImage.push()
				//}
            }
        }
		stage('Deploy') {
            steps {
                echo 'Building Docker image ...'
				//sh 'rm /root/target/${applicationName}*.jar'
            }
        }
    }
}