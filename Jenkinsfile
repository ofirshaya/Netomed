node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("35.188.146.83:400/ofirimage")
    }
    
    stage('Test image') {
        echo "Testing Image"
        sh  "docker run -d -p 80:80 --name my_app 35.188.146.83:5000/ofirimage"
        dir('test'){
		echo "running python"
		ANSWER = sh(returnStdout: true , script: 'python2.7 unittest.py').trim()
		if (ANSWER == 0) {	
			echo '[FAILURE] Failed to build'
			error('Stopping early…')
            		currentBuild.result = 'FAILURE'
			currentBuild.result = 'ABORTED'
		} else {
		    echo "Test passed"
		}
 	 }
    }
    stage('Clean things'){
        sh "docker kill my_app"
        sh "docker rm my_app"

    }
    stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('35.188.146.83:5000', 'docker-hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }
    
}
