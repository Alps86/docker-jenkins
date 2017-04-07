node {
   stage('Preparation') {
        checkout scm
   }
   stage('Build') {
        sh 'docker-compose up -d'
   }
   stage('Results') {
        docker.image('alpine').inside {
            echo 'Results';
        }
   }
}
