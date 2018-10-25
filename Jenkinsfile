pipeline {
    agent any
	
	environment {
		package_version = "0.1.0"
		dockerRegistry = "maddoudou22/api-javaspringboot"
		registryCredential = 'dockerhub'
		applicationName = 'API-javaSpringboot' // Same as artifactId in pom.xml
    }
    stages {
		stage('prepare') {
			steps {
				*/script {
					pom = readMavenPom file: 'pom.xml'
					pom.version
					echo pom.version
				}*/
				pom = readMavenPom file: 'pom.xml'
				echo 'cocuou'
				//echo pom.version
				echo 'cocuou2'
				echo ${pom.version}
				echo 'cocuou3'
		    }
        }
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
				//sh 'docker build --build-arg PACKAGE_VERSION=${package_version} -t ${dockerRegistry}:${package_version} .'
				sh 'docker build --build-arg PACKAGE_VERSION=pom.version -t ${dockerRegistry}:${package_version} .'
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