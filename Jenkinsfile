node {
   stage('Checkout') {
        checkout scm
   }
   stage('Build') {
        withEnv(['BRANCHE_NAME=$(echo $BRANCH_NAME | sed "s/\\//-/g")']) {
            sh 'printenv'
            sh 'docker-compose up -d --force-recreate'
        }
   }
   stage('Results') {
        docker.image('alpine').inside {
            echo 'Results';
        }
   }
}
