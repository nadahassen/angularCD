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
   
      
      stage("build")
        {
            steps{
                script{
                    sh "sudo npm install --force"
                    sh "sudo ansible-playbook ansible/build.yml -i ansible/inventory/host.yml -e ansible_become_password=root "
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
