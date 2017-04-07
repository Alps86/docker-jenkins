node {
   stage('Checkout') {
        checkout scm
   }
   stage('Build') {
        sh 'export test=$(echo $BRANCH_NAME | sed "s/\\//-/g")'

        withEnv(['BRANCHE_NAME2=$test']) {
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
