# Jenkin pipelines

## Introduction

### What is Jenkins Pipeline?
A Jenkins pipeline is a suite of plugins which supports implementing and integrating continuous delivery pipelines into Jenkins.

Allows you to define an entire application life cycle as code.

A continuous delivery (CD) pipeline is an automated expression of your process for getting software from version control right through to your users and customers. Every change to your software (committed in source control) goes through a complex process on its way to being released. This process involves building the software in a reliable and repeatable manner, as well as progressing the built software (called a "build") through multiple stages of testing and deployment.

### Why Jenkins Pipeline?
Jenkins Pipeline has many features that make it a powerful tool for use in continuous delivery pipelines.

- Code: Pipeline code is written in Jenkinsfile which can be checked into a source control management system such as Git, giving teams the ability to edit, review, and iterate upon their delivery pipeline.
- Durable: Pipelines can survive both planned and unplanned restarts of the Jenkins controller.
- Pausable: Pipelines can optionally stop and wait for human input or approval before continuing the Pipeline run.
- Versatile: Pipelines support complex real-world CD requirements, including the ability to fork/join, loop, and perform work in parallel.
- Extensible: The Pipeline plugin supports custom extensions to its DSL [1] and multiple options for integration with other plugins.


### What is Jenkinsfile?
A Jenkinsfile is a text file that contains the definition of a Jenkins Pipeline and is checked into source control. 

A jenkinsfile is written in groovy, script language used in defining jobs in jenkins.

Jenkins pipeline supports two syntaxes, Declarative and Scripted.

### Declarative Pipeline

1. Declarative Pipeline is a relatively recent addition to Jenkins Pipeline which presents a more simplified and opinionated syntax on top of the Pipeline sub-systems.
2. It is a more user-friendly wrapper built around the Jenkins Pipeline syntax, providing a fluent DSL API to drive our pipeline.
3. Declarative Pipeline is a more recent feature of Jenkins Pipeline which:

    - provides richer syntactical features over Scripted Pipeline syntax,
    - and is designed to make writing and reading Pipeline code easier.

4. Declarative Pipeline must be enclosed within a pipeline block, which denotes its entire configuration.
5. Declarative Pipeline syntax also provides tighter control over syntax and semantics throughout the development of Pipeline code, and also offers a more simplified structure.

### Scripted Pipeline

1. Scripted Pipeline is the legacy way to code Pipeline in jenkins.
2. Scripted Pipeline syntax, on the other hand, offers a general purpose DSL syntax.


### Jenkinsfile structure

The Jenkinsfile has two key sections: the `pipeline` section and the `agent` section.

1. Pipeline Section: The heart of the Jenkinsfile, this section defines the overall workflow of your pipeline, encompassing the stages and steps involved in your CI/CD process. It outlines the tasks to be executed, ranging from code compilation and testing to deployment and release management.

2. Agent Section: The agent section specifies where the entire Pipeline, or a specific stage, will execute in the Jenkins environment depending on where the agent section is placed. The section must be defined at the top-level inside the pipeline block, but stage-level usage is optional.

If no agent is specified, then the entire Pipeline will run on the master.

### Jenkinsfile example

```groovy

pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
    
```

Note: Not all pipeline will have all the stages and it all depends on the project.

The above pipeline will have three stages, Build, Test and Deploy. Each stage will have a step which will be executed. 

### Running the pipeline

1. Create a new pipeline job in jenkins.

2. Select the pipeline script from SCM option and provide the git repository url and the branch name.

3. Save the job and run it.

4. The pipeline will be executed.


![pipeline](/Images/jenkins/stages.png)

### console output

![Console output](/Images/jenkins/output.png)


This is a simple pipeline which will execute the three stages and print the output.

In the next challenge we will use real world example and create a pipeline for it.

Happy Coding!