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
				sh 'mvn clean deploy'
            }
        }
		stage('Sonar - Code Quality') {
            steps {
                echo 'Check Code Quality ...'
				sh 'mvn sonar:sonar -Dsonar.host.url=http://18.203.166.52:9000 -Dsonar.login=e07f53d60fe3c1095d12eb3c51664ea1034c3afb'
            }
        }
		stage('OWASP - Dependencies check') {
            steps {
                echo 'Check OWASP dependencies ...'
				sh 'mvn verify'
				dependencyCheckPublisher canComputeNew: false, defaultEncoding: '', healthu: '', pattern: '**/dependency-check-report.xml', unHealthy: '' 
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