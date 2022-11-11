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
                    sh "ansible-playbook Ansible/build.yml -i ansible/inventory/host.yml "
                }}}
      stage('Build 2 ') {
            steps {
                script{
                    sh "ansible-playbook Ansible/docker.yml -i ansible/inventory/host.yml "
                }}}
      stage('Build 3 ') {
            steps {
                script{
                    sh "ansible-playbook Ansible/docker-registry.yml -i ansible/inventory/host.yml "
                }}}
    }
}
