
### `documentation/ci-cd.md`

```markdown
# CI/CD Documentation

## Overview

This document provides an overview of the CI/CD pipeline setup using Jenkins.

## Jenkins Setup

1. Install Jenkins following the [official Jenkins installation guide](https://www.jenkins.io/doc/book/installing/).
2. Install necessary plugins (e.g., Git, Pipeline).
3. Create a new Jenkins job and configure it to use the provided `Jenkinsfile` from the `ci-cd` directory.

## Jenkinsfile

The `Jenkinsfile` defines the stages of the CI/CD pipeline:

- **Checkout**: Clones the repository.
- **Install Dependencies**: Installs npm packages for both the web and API applications.
- **Build**: Builds the applications.
- **Test**: Runs tests for both applications.
- **Deploy**: Executes the `deploy.sh` script for deployment.

## Environment Variables

Ensure the necessary environment variables are set in the Jenkins job configuration:

- `NODE_ENV=production`

## Triggering Builds

- Manual: Trigger builds manually from the Jenkins dashboard.
- Automatic: Set up webhooks or scheduled builds as needed.

## Monitoring and Logs

- Monitor the build status from the Jenkins dashboard.
- Check the build logs for any errors or issues during the pipeline execution.

## Example Jenkinsfile

```groovy
pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://git.toptal.com/henrique/node-3tier-app2.git', branch: 'master'
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    dir('api') {
                        sh 'npm install'
                    }
                    dir('web') {
                        sh 'npm install'
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    dir('api') {
                        sh 'npm run build'
                    }
                    dir('web') {
                        sh 'npm run build'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    dir('api') {
                        sh 'npm test'
                    }
                    dir('web') {
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    dir('scripts') {
                        sh './deploy.sh'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
