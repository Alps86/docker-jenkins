node {
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
       // This step should not normally be used in your script. Consult the inline help for details.
       catchError {
           sh 'make phpcs-ci'
       }
       sh 'cat app/build/checkstyle.xml'

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
