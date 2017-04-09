node {
   stage('Checkout') {
        checkout scm
   }
   stage('Build') {
        sh 'ls -al app/'
        sh 'make docker-build'
        sh 'make copy-data'
   }
   stage('Composer') {
        sh 'make composer'
   }
   stage('Checkstyle') {
       sh 'make phpcs-ci'
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
