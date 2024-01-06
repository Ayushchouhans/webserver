pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'githubtoken', url: 'https://github.com/Ayushchouhans/webserver.git']])
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Define the variables
                    def remoteServer = '18.144.11.140'
                    def remoteUser = 'root'
                    def remoteDirectory = '/var/www/html/'  // Adjust the path based on your web server configuration

                    // Clone the repository on the web server
                    sh "ssh ${remoteUser}@${remoteServer} 'rm -rf /var/www/html/*'"

                    // Copy files to the web server directory, override existing files
                    sh "ssh ${remoteUser}@${remoteServer} 'cd /var/www/html && git clone https://github.com/Ayushchouhans/webserver.git'"

                    // Restart Apache on the web server
                    sh "ssh ${remoteUser}@${remoteServer} 'systemctl restart apache2'"

                    // Clean up: Delete the temporary repository on the web server
                    // sh "ssh ${remoteUser}@${remoteServer} 'rm -rf /tmp/webserver'"
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
