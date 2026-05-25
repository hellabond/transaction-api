pipeline:
  name: Transaction API Pipeline
  identifier: transaction_api_pipeline
  projectIdentifier: my_project
  stages:
    - stage:
        name: Checkout
        identifier: checkout
        type: CI
        spec:
          execution:
            steps:
              - step:
                  name: Git Checkout
                  identifier: git_checkout
                  type: GitClone
                  spec:
                    connectorRef: sai_charan
                    repoName: transaction-api
                    branch: main

    - stage:
        name: Build
        identifier: build
        type: CI
        spec:
          execution:
            steps:
              - step:
                  name: Maven Build
                  identifier: maven_build
                  type: Run
                  spec:
                    command: mvn clean install

    - stage:
        name: Test
        identifier: test
        type: CI
        spec:
          execution:
            steps:
              - step:
                  name: Maven Test
                  identifier: maven_test
                  type: Run
                  spec:
                    command: mvn test

    - stage:
        name: Docker Build
        identifier: docker_build
        type: CI
        spec:
          execution:
            steps:
              - step:
                  name: Build Docker Image
                  identifier: docker_build_step
                  type: Run
                  spec:
                    command: docker build -t transaction-api:latest .

    - stage:
        name: Deploy
        identifier: deploy
        type: CI
        spec:
          execution:
            steps:
              - step:
                  name: Run Docker Container
                  identifier: docker_run
                  type: Run
                  spec:
                    command: docker run -d -p 8081:8080 transaction-api:latest
