node {
   stage('Checkout') {
        checkout scm
   }
   stage('Build') {
        sh 'docker-compose build'
   }
   stage('Start') {
        env.BRANCH_NAME = getBranchName("${env.BRANCH_NAME}")
        sh 'docker-compose up -d --force-recreate'
   }
   stage('Results') {
        docker.image('alpine').inside {
            echo 'Results';
        }
   }
}

def getBranchName(String branch) {
    return branch.replace('/', '.')
}
