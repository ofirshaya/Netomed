node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("35.188.146.83:5000/ofirimage")
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
	sh "docker push 35.188.146.83:5000/ofirimage"
	echo "finished"
    }
    
}
