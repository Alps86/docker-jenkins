node {
   stage('Preparation') {
        checkout scm
   }
   stage('Build') {
        sh 'docker-compose ps'
   }
   stage('Results') {
        docker.image('alpine').inside {
            echo 'Results';
        }
   }
}
