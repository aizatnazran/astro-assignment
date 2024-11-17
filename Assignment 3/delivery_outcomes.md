# Delivery Outcomes for Jenkins Pipeline Deployment

This document highlights the execution of the pipeline-as-code project using Jenkins to deploy a containerized application.

---

## Delivery Outcome

**Explanation**:

- The pipeline is written in a Jenkinsfile and automates the following stages:

1. Clean Workspace: Ensures a clean workspace for each pipeline run.
2. Checkout Code: Retrieves the code from the GitHub repository.
3. Stop and Remove Specific Containers: Identifies and removes outdated containers for seamless deployment.
4. Remove Old Docker Images: Cleans up old images to free disk space.
5. Versioning: Updates the application version dynamically in a VERSION.txt file.
6. Build Docker Images: Builds separate Docker images for the front-end and back-end services.
7. Deploy Application: Uses docker-compose to deploy the services.
8. Commit and Push Version Update: Automatically commits and pushes the updated version back to the GitHub repository.

**Evidence**:

- The pipeline script (Jenkinsfile.docker) is stored in the GitHub repository:
  https://github.com/aizatnazran/devops-project-planner.git

- The pipeline integrates with GitHub via webhooks to trigger on code changes.

- A video demonstration of the CI/CD workflow (CICD-Demonstration.mp4) is included in the project repository.
  - Note: The video has been trimmed to reduce waiting times for build processes.

## Containerized Application Deployment

**Requirement**: Deploy a containerized application using a container orchestration tool.

**Status**: ✅❌ Partially Delivered

**Explanation**:

- The deployment uses Docker and docker-compose for container orchestration.
  Kubernetes (K8s) was not used due to time constraints and facing installation issues on my server.

- The application comprises front-end and back-end services. A JSON server is used for data, so no database is configured. Data resets with each container rebuild.

**Evidence**:

- Application URL : https://astro.aizat.dev

## Versioning Mechanism

Implement versioning for the application to confirm changes made on the application's code

**Explanation**:

- A VERSION.txt file in the front-end directory is updated automatically during the pipeline run.

- The version increments for each successful build, ensuring traceability.
