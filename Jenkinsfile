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
                    sh "ansible-playbook Ansible/build.yml -i Ansible/inventory/host.yml "
                }}}
      stage('Build 2 ') {
            steps {
                script{
                    sh "ansible-playbook Ansible/docker.yml -i Ansible/inventory/host.yml "
                }}}
      stage('Build 3 ') {
            steps {
                script{
                    sh "ansible-playbook Ansible/docker-registry.yml -i Ansible/inventory/host.yml "
                }}}
    }
}
