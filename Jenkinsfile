 pipeline {
        agent any
        parameters {
            string(name: 'myInput', description: 'Some pipeline parameters')
        }
        stages {
            stage('Fetch code') {
                steps {
                    script {
                        git 'https://github.com/net-wizard/simpli-project.git'
                    }
                }
            }
            stage('Deploy app') {
                steps {
                    script {
                        ansiblePlaybook installation: 'Ansible', playbook: 'deploy.yml'
                    }
                }
            }
        }
    }