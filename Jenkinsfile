pipeline {
    agent any
	
	environment {
		package_version = readMavenPom().getVersion()
		dockerRegistry = "maddoudou22/api-javaspringboot"
		//registryCredential = 'dockerhub'
		applicationName = 'API-javaSpringboot' // Same as artifactId in pom.xml
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building ...'
				sh 'mvn -Dmaven.test.skip=true clean install'
            }
        }
		
		stage('Unit test') {
            steps {
                echo 'Unit testing ...'
				sh 'mvn test'
            }
        }

		stage('Publish snapshot') {
            steps {
                echo 'Publising into the snapshot repo ...'
				sh 'mvn jar:jar deploy:deploy'
            }
        }
		
		stage('OWASP - Dependencies check') {
            steps {
                echo 'Check OWASP dependencies ...'
				sh 'mvn dependency-check:check'
				sh 'cp target/dependency-check-report.html .'
            }
        }
		
		stage('Sonar - Code Quality') {
            steps {
                echo 'Check Code Quality ...'
				//sh 'mvn package sonar:sonar -Dsonar.host.url=http://18.203.166.52:9000 -Dsonar.login=5db071a4af91f70a26089a039369660aecf974e2'
				//sh 'mvn sonar:sonar -Dsonar.host.url=http://18.203.166.52:9000 -Dsonar.login=5db071a4af91f70a26089a039369660aecf974e2'
				sh 'mvn sonar:sonar' // -Dsonar.dependencyCheck.reportPath=target/dependency-check-report.xml'
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