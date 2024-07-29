
### `documentation/deploy.md`

```markdown
# Deployment Documentation

## Deploying the Application

1. SSH into the Jenkins server.
2. Ensure the `Jenkinsfile` is configured correctly.
3. Trigger a build in Jenkins to start the deployment pipeline.

## Deployment Pipeline

The deployment pipeline defined in the `Jenkinsfile` includes the following stages:

- **Checkout**: Clones the repository.
- **Install Dependencies**: Installs necessary npm packages for both the web and API applications.
- **Build**: Builds the applications.
- **Test**: Runs tests for both the web and API applications.
- **Deploy**: Executes the `deploy.sh` script to deploy the applications.

## `deploy.sh` Script

The `deploy.sh` script performs the following tasks:

1. Updates and upgrades the system packages.
2. Installs Node.js and npm.
3. Updates npm to the latest version.
4. Pulls the latest code from the repository.
5. Installs dependencies for both web and API applications.
6. Restarts the web and API services using systemd.

## Accessing the Application

- **Web Application**: Access the web application using the public DNS of the web instance.
- **API Application**: The API is accessible via the public IP of the API instance on port 8080.

Example:

```bash
curl http://<api-instance-public-ip>:8080/api/status
