node {
   stage('Checkout') {
        checkout scm
   }
   stage('Build') {
        sh 'docker-compose up -d --force-recreate'
   }
   stage('Results') {
        docker.image('alpine').inside {
            echo 'Results';
        }
   }
}
