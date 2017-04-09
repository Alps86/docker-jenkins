node {
   try {
       currentBuild.result = "SUCCESS"
       stage('Checkout') {
            checkout scm
       }
       stage('Build') {
            env.BRANCH_NAME = getBranchName("${env.BRANCH_NAME}")
            sh 'make docker-build'
            sh 'docker-compose up -d --force-recreate'
            sh 'make copy-data'
       }
       stage('Composer') {
            sh 'make composer'
       }
       stage('Checkstyle') {
           sh 'make phpcs-ci'
       }
       stage('Results') {
            docker.image('alpine').inside {
                echo 'Results';
            }
       }
   }
   catch (err) {
       currentBuild.result = "FAILURE"
       sh 'make copy-data-from-docker'
       sh 'cat app/build/checkstyle.xml'

       throw err
   }
}

def getBranchName(String branch) {
    return branch.replace('/', '.')
}
