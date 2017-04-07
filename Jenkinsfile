node {
   stage('Checkout') {
        checkout scm
   }
   stage('Build') {
        env.BRANCH_NAME = getBranchName(env.BRANCH_NAME)
        sh 'docker-compose up -d --force-recreate'
   }
   stage('Results') {
        docker.image('alpine').inside {
            echo 'Results';
        }
   }
}

def getBranchName(String branch) {
    sh 'echo $BRANCH_NAME | sed "s/\\//./g" > .git/branchName'
    branchName = readFile('.git/branchName').trim()
    return branchName;
}
