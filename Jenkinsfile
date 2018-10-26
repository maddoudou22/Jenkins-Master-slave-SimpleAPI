pipeline {
    agent any
	
	environment {
		package_version = readMavenPom().getVersion()
		dockerRegistry = "maddoudou22/api-javaspringboot"
		registryCredential = 'dockerhub'
		applicationName = 'API-javaSpringboot' // Same as artifactId in pom.xml
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building in the snapshot repo ...'
				//sh 'mvn clean package -DtargetRepo=/var/lib/repositories/API-javaSpringboot_local/snapshot/'
				sh 'mvn clean package'
				//sh 'mvn clean deploy'
            }
        }
		stage('OWASP') {
            steps {
                echo 'Check dependencies ...'
				sh 'mvn verify'
				//sh 'mvn dependency-check:check'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
				sh 'ls target/${applicationName}*'
            }
        }
        stage('Bake') {
            steps {
                echo 'Building Docker image ...'
				sh 'docker build --build-arg PACKAGE_VERSION=${package_version} -t ${dockerRegistry}:${package_version} .'
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