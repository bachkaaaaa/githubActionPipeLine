# Whole Pipeline

This project automates the build and deployment pipeline using GitHub Actions for a Node.js and Angular-based application. It builds a Docker image, scans for vulnerabilities, and pushes the image to DockerHub.

## Overview

The pipeline automates several key steps for continuous integration (CI) and continuous delivery (CD), including:

1. **Checkout the Code**: Pulls the latest code from the repository.
2. **Set Up Node.js**: Installs the necessary version of Node.js and dependencies.
3. **Linting**: Runs linting checks on the codebase to ensure code quality.
4. **Build the Docker Image**: Builds a Docker image from the application.
5. **Run Vulnerability Scanning**: Uses the Trivy action to scan the Docker image for critical and high-severity vulnerabilities.
6. **Push the Docker Image**: Pushes the Docker image to DockerHub for deployment.

## Technologies Used

- **Node.js**: JavaScript runtime for server-side development.
- **Angular**: Frontend framework for building single-page applications.
- **Docker**: Containerization platform used to package and distribute the application.
- **Trivy**: A vulnerability scanner used to ensure the Docker image is secure.
- **GitHub Actions**: Automation tool to define and run CI/CD workflows.

## GitHub Actions Workflow

This repository includes a GitHub Actions workflow that runs automatically when a push is made to the `master` branch. The workflow is defined in the `.github/workflows/wholepipeline.yml` file and contains the following steps:

### 1. Checkout the Code

The workflow starts by checking out the latest version of the code from the repository using the `actions/checkout` action.

### 2. Set Up Node.js

The required version of Node.js (`18.13`) is set up using the `actions/setup-node` action, ensuring the correct runtime for the application.

### 3. Install Dependencies

It installs project dependencies by running the `npm ci` command, ensuring a clean and reproducible installation of all dependencies.

### 4. Install Angular CLI

The Angular CLI (`17.3.2`) is installed globally using `npm install -g @angular/cli`.

### 5. Linting

The `ng lint` command is executed to ensure the code follows Angular's linting rules and standards.

### 6. Build Docker Image

The project is packaged into a Docker image with the `docker builder build` command. The resulting image is tagged with the DockerHub username and a custom tag.

### 7. Log in to DockerHub

The workflow logs into DockerHub using the provided credentials (stored securely as GitHub secrets), allowing the image to be pushed to the DockerHub registry.

### 8. Run Vulnerability Scanning

The `aquasecurity/trivy-action` is used to scan the Docker image for any vulnerabilities, specifically targeting critical and high-severity vulnerabilities in the operating system and libraries.

### 9. Push Docker Image

Finally, the Docker image is pushed to DockerHub using the `docker push` command, making it available for deployment.

## Setup Instructions

1. **DockerHub Account**: Ensure you have a DockerHub account and the credentials stored as GitHub secrets (`DOCKERHUB_USERNAME` and `DOCKERHUB_PASSWORD`).
2. **Repository Setup**:
   - Add the workflow configuration in `.github/workflows/wholepipeline.yml`.
   - Make sure your Angular and Node.js project is set up correctly and that all dependencies are listed in `package.json`.

## Running the Workflow

The workflow runs automatically on each push to the `master` branch. To trigger it manually, push your changes to the `master` branch of the repository.
