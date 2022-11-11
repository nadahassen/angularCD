pipeline {
    agent any

    stages {
        stage('Gut hub pull stage ') {
            steps {
                script{
                    checkout([$class: 'GitSCM' , branches: [[name: '*/master']] ,
                       userRemoteConfigs: [[
                           credentialsId: 'Githubcredentials',
                           url :'https://github.com/nadahassen/angularCD.git']]])
                }
            
            }
        }
      stage('Build 1 ') {
            steps {
                script{
                    sh "ansible-playbook ansible/build.yml -i ansible/inventory/host.yml "
                }}}
      stage('Build 2 ') {
            steps {
                script{
                    sh "ansible-playbook ansible/docker.yml -i ansible/inventory/host.yml "
                }}}
      stage('Build 3 ') {
            steps {
                script{
                    sh "ansible-playbook ansible/docker-registry.yml -i ansible/inventory/host.yml "
                }}}
    }
}
