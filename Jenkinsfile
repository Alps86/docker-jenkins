node {
   stage('Checkout') {
        checkout scm
   }
   stage('Build') {
        def branchName = getBranchName(env.BRANCH_NAME)

        withEnv(['BRANCHE_NAME2=${branchName}']) {
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

def getBranchName(String branch) {
    sh 'echo $BRANCH_NAME | sed "s/\\//-/g" > .git/branchName'
    branchName = readFile('.git/branchName')
    echo "${branchName}"
}
