node {
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
      try {
            sh 'make phpcs-ci'
      }
      catch (err) {
            //currentBuild.result = "FAILURE"
      }
      sh 'make copy-build-data'
      sh 'cat app/build/phpcs.xml'
      //step([$class: 'hudson.plugins.checkstyle.CheckStylePublisher', checkstyle: 'app/build/phpcs.xml'])
      step([$class: 'CheckStylePublisher', pattern: 'app/build/phpcs.xml'])

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
