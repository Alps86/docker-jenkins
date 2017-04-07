node {
   stage('Preparation') { // for display purposes
        docker.image('alpine').inside {
            echo 'Preparation';
        }
   }
   stage('Build') {
        docker.image('alpine').inside {
            echo 'Build';
        }
   }
   stage('Results') {
        docker.image('alpine').inside {
            echo 'Results';
        }
   }
}
