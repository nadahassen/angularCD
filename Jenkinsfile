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
   
      
      stage("build 1 ")
        {
            steps{
                script{
                   
                     sh " npm install --force"
                    sh " ansible-playbook ansible/build.yml -i ansible/inventory/host.yml -e ansible_become_password=root "
                }
            }
          
        }
      stage('Build 2 ') {
            steps {
                script{
                    sh "ansible-playbook ansible/docker.yml -i ansible/inventory/host.yml -e ansible_become_password=root"
                }}}
      stage('Build 3 ') {
            steps {
                script{
                    sh "ansible-playbook ansible/docker-registry.yml -i ansible/inventory/host.yml -e ansible_become_password=root"
                }}}
    }
}
