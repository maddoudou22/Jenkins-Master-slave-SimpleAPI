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
				sh 'mvn deploy'
            }
        }
		stage('OWASP - Dependencies check') {
            steps {
                echo 'Check OWASP dependencies ...'
				//sh 'mvn verify'
				//sh 'mvn clean dependency-check:check'
				sh 'mvn dependency-check:check'
				sh 'cp target/dependency-check-report.html target/dependency-check/'
				sh 'cp target/dependency-check-report.html .'
				sh 'cp target/dependency-check/dependency-check-report.xml target/'
				sh 'cp target/dependency-check/dependency-check-report.xml .'
				sh 'mvn sonar:sonar' // -Dsonar.dependencyCheck.reportPath=target/dependency-check-report.xml'
				//sh 'mvn org.owasp:dependency-check-maven:1.3.6:check -Dformat=XML'
				//dependencyCheckPublisher canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/dependency-check-report.xml', unHealthy: '' 
            }
        }
		stage('Sonar - Code Quality') {
            steps {
                echo 'Check Code Quality ...'
				//sh 'mvn package sonar:sonar -Dsonar.host.url=http://18.203.166.52:9000 -Dsonar.login=5db071a4af91f70a26089a039369660aecf974e2'
				//sh 'mvn sonar:sonar -Dsonar.host.url=http://18.203.166.52:9000 -Dsonar.login=5db071a4af91f70a26089a039369660aecf974e2'
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