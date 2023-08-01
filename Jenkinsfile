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
            stage('Handle existing docker image') {
                steps {
                    script {
                        sh '''docker stop $(docker ps -a -q)'''
                        sh '''docker rm $(docker ps -aq)'''
                        sh '''docker rmi portfolio-app'''
                    }
                }
            }
            stage('Building docker') {
                steps {
                    script {
                        sh '''docker build . -t portfolio-app'''
                        sh '''docker run -d -p 80:3000 portfolio-app'''
                    }
                }
            }
        }
    }