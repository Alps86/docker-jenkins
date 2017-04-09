node {
   properties([disableConcurrentBuilds(), pipelineTriggers([])])
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
   stage('Static Code Anaylse') {
      parallel Checkstyle: {
         try {
               sh 'make phpcs-ci'
         }
         catch (err) {
               currentBuild.result = "WARNING"
         }
       }, PMD: {
          try {
              sh 'make phpmd-ci'
          }
          catch (err) {
              //currentBuild.result = "FAILURE"
          }
       },
       failFast: false
   }
   stage('Results') {
        sh 'make copy-build-data'
        step([$class: 'CheckStylePublisher', pattern: 'app/build/logs/phpcs.xml'])
        step([$class: 'PmdPublisher', canComputeNew: false, defaultEncoding: '', healthy: '', pattern: 'app/build/logs/pmd.xml', unHealthy: ''])
        //step([$class: 'AnalysisPublisher', canComputeNew: false, canRunOnFailed: true, defaultEncoding: '', healthy: '', unHealthy: ''])
       // if (fileExists 'app/build/logs/junit.xml') {
       //     junit 'app/build/logs/junit.xml'
        //}
   }
}

def getBranchName(String branch) {
    return branch.replace('/', '.')
}
