pipeline {
    agent any
	
	environment {
		package_version = readMavenPom().getVersion()
		dockerRegistry = "maddoudou22/api-javaspringboot"
		//registryCredential = 'dockerhub'
		applicationName = 'API-javaSpringboot' // Same as artifactId in pom.xml
		kubernetesNodePrivateIP = '172-18-1-189'
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
            }
        }
		
		stage('Sonar - Code Quality') {
            steps {
                echo 'Check Code Quality ...'
				sh 'mvn sonar:sonar' // -Dsonar.dependencyCheck.reportPath=target/dependency-check-report.xml'
            }
        }
		
        stage('Contract testing') {
            steps {
                echo 'Testing application conformity according to its Swagger definition ...'

            }
        }
		
        stage('Bake') {
            steps {
                echo 'Building Docker image ...'
				sh 'docker build --rm --build-arg PACKAGE_VERSION=${package_version} --build-arg APPLICATION_NAME=${applicationName} -t ${dockerRegistry}:${package_version} .'
				echo 'Removing dangling Docker image ...'
				sh 'docker rmi $(docker images --filter "dangling=true" -q --no-trunc) 2>/dev/null'
            }
        }

		stage('Deploy') {
            steps {
                echo 'Deploying Docker image in Kubernetes ...'
				sh 'ssh -i /var/lib/keys/aws_ireland_keypair.pem ubuntu@${kubernetesNodePrivateIP} "kubectl get nodes"'
				
            }
        }
    }
}