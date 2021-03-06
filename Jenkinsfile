pipeline {
	agent { 
        node {
            //label '!master'
			//label '	jenkins-slave-manu'
			label 'slavespot'
        }
    }
	
	environment {
		package_version = readMavenPom().getVersion()
		dockerRegistry = "962109799108.dkr.ecr.eu-west-1.amazonaws.com"
		DOCKER_CACHE_IMAGE_VERSION = "latest"
		dockerRepo = "jenkins-master-slave-simpleapi"
		applicationName = 'Jenkins-Master-slave-SimpleAPI' // Same as artifactId in pom.xml
		AWS_REGION = "eu-west-1"
		AWS_ACCOUNT_ID = "962109799108"
		SONAR_ENDPOINT = "http://34.240.115.247:9000"
		EC2_LOCAL_MAVEN_DEPENDENCIES_DIRECTORY = "/home/ubuntu/.m2"
		S3_BUCKET_MAVEN_DEPENDENCIES = "s3://jenkinsspotfleetmavencache/Jenkins-Master-slave-SimpleAPI/.m2/"
    }
	
    stages {
		stage('Download dependencies from S3') {
            steps {
				echo 'Get the cached maven dependencies from an S3 bucket ...'
				//sh 'mkdir -p $EC2_LOCAL_MAVEN_DEPENDENCIES_DIRECTORY'
				sh 'aws s3 sync $S3_BUCKET_MAVEN_DEPENDENCIES $EC2_LOCAL_MAVEN_DEPENDENCIES_DIRECTORY'
			}
        }
		
	    stage('Prepa baking') {
            steps {
                echo 'Getting previous image ...'
				sh 'echo \"Si l\'image cache n\'existe pas dans le repo ECR elle est reconstruire, sinon elle est telechargee\"'
				sh 'chmod +x build-docker.sh'
				sh './build-docker.sh $dockerRepo $DOCKER_CACHE_IMAGE_VERSION dockerfile_basis $AWS_REGION $AWS_ACCOUNT_ID'
            }
        }
        stage('Build') {
            steps {
                echo 'Building ...'
				//sh 'mvn -T 1C -Dmaven.test.skip=true dependency:purge-local-repository clean package'
				sh 'mvn -T 1C -Dmaven.test.skip=true clean package'
            }
        }
		
		stage('Unit test') {
            steps {
                echo 'Unit testing ...'
				sh 'mvn -T 1C test'
            }
        }

		stage('OWASP - Dependencies check') {
            steps {
                echo 'Check OWASP dependencies ...'
				
				//sh 'mvn dependency-check:purge'
				sh 'mvn dependency-check:check'
            }
        }
		
		stage('Sonar - Code Quality') {
            steps {
                echo 'Check Code Quality ...'
				sh 'mvn sonar:sonar -Dsonar.host.url=$SONAR_ENDPOINT' // -Dsonar.dependencyCheck.reportPath=target/dependency-check-report.xml'
            }
        }

        stage('Bake') {
            steps {
                echo 'Building Docker image ...'
				sh '$(aws ecr get-login --no-include-email --region $AWS_REGION)'
				sh 'docker build --build-arg PACKAGE_VERSION=${package_version} --build-arg APPLICATION_NAME=${applicationName} -t ${dockerRegistry}/${dockerRepo}:${package_version} .'
				echo 'Publishing Docker image into the private registry ...'
				sh 'docker push ${dockerRegistry}/${dockerRepo}:${package_version}'
            }
        }
		
		stage('Dependencies sync') {
            steps {
				echo 'Copying the maven dependencies to an S3 bucket ...'
				sh 'aws s3 sync $EC2_LOCAL_MAVEN_DEPENDENCIES_DIRECTORY $S3_BUCKET_MAVEN_DEPENDENCIES'
			}
        }
    }

}
