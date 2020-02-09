node {
    def app
    stage('Clone repository') {
      checkout scm
    }
    stage('Build Image') {
        app = docker.build("shashi256/nodeapp")
    }
    stage('Push Image') {
    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
        app.push("${env.BUILD_NUMBER}")
        app.push("latest")
        }
            echo "Trying to psusj docker build to DockerHub"

    }
    stage("Deploy To Kuberates Cluster"){
       kubernetesDeploy(
         configs: 'ReplicationController.yml',
         kubeconfigId: 'KUBERNETES_CONFIG',
         enableConfigSubstitution: true
        )
     }
}
