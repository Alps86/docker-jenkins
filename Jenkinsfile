node {
   stage('Checkout') {
        checkout scm
   }
   stage('Build') {
        env.BRANCH_NAME = getBranchName("${env.BRANCH_NAME}")
        sh 'ls -al app/'
        sh 'make docker-build'
   }
   stage('Composer') {
        sh 'make composer'
   }
   stage('Checkstyle') {
       sh 'make phpcs-ci'
   }
   stage('Start') {
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
