node {
   stage('Checkout') {
        checkout scm
   }
   stage('Build') {
        sh 'ls -al app/'
        sh 'docker-compose build'
   }
   stage('Composer') {
        sh 'docker-compose run composer install'
   }
   stage('Checkstyle') {
       sh 'docker-compose run php /app/vendor/squizlabs/php_codesniffer/scripts/phpcs --report=checkstyle --report-file=/app/build/checkstyle.xml /app/src/'
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
