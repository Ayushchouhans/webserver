pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Define the variables
                    def remoteServer = '54.176.250.229'
                    def remoteUser = 'ubuntu'
                    def remoteDirectory = '/var/www/html'  // Adjust the path based on your web server configuration

                    // SSH into the web server and deploy the code
                    sh "ssh ${remoteUser}@${remoteServer} 'cd ${remoteDirectory} && git pull origin master'"

                    // Optional: Restart Apache or perform other necessary actions
                    // sh "ssh ${remoteUser}@${remoteServer} 'sudo systemctl restart apache2'"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }

        failure {
            echo 'Deployment failed!'
        }
    }
}
