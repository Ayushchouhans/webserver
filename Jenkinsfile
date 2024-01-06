pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout([$class: 'GitSCM', branches: [[name: 'master']], userRemoteConfigs: [[url: 'https://github.com/Ayushchouhans/webserver.git']]])
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Define the variables
                    def remoteServer = '54.176.250.229'
                    def remoteUser = 'ubuntu'
                    def remoteDirectory = '/var/www/html'  // Adjust the path based on your web server configuration

                    // Clone the repository on the web server
                    sh "ssh ${remoteUser}@${remoteServer} 'git clone https://github.com/Ayushchouhans/webserver.git /tmp/deploy-repo'"

                    // Copy files to the web server directory, override existing files
                    sh "ssh ${remoteUser}@${remoteServer} 'cp -r /tmp/deploy-repo/* ${remoteDirectory}'"

                    // Restart Apache on the web server
                    sh "ssh ${remoteUser}@${remoteServer} 'sudo systemctl restart apache2'"

                    // Clean up: Delete the temporary repository on the web server
                    sh "ssh ${remoteUser}@${remoteServer} 'rm -rf /tmp/deploy-repo'"
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
