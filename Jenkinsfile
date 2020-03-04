node {
   def mvnHome
   def appimage
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git branch: 'xl-k8s',
            url: 'https://github.com/amitmohleji/spring-petclinic.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'maven3'
   }    
    stage('Build') {
        sh "./mvnw clean package"
   }
   stage('Test') {
       sh "${mvnHome}/bin/mvn test"
   }
   stage('Update Manifest'){
       sh "sed -i 's/{{BUILD_NUMBER}}/$BUILD_NUMBER/g' deployit-manifest.xml"
   }
   stage('Update K8s.yaml'){
       sh "sed -i 's/{{BUILD_NUMBER}}/$BUILD_NUMBER/g' petclinic.yaml/k8s.yaml"
   }
   stage('Build Docker Image') {
       appimage = docker.build("amitmohleji/petclinic:$BUILD_NUMBER")
   }
   stage('Push Image to Registry(dockerhub)') {
       docker.withRegistry("", "cred") {
           appimage.push("$BUILD_NUMBER")
       }
   }
   stage('Publish'){
       xldCreatePackage artifactsPath: '.', manifestPath: 'deployit-manifest.xml', darPath: '$JOB_NAME-$BUILD_NUMBER.0.dar'
       xldPublishPackage serverCredentials: 'admin', darPath: '$JOB_NAME-$BUILD_NUMBER.0.dar'
   }
        
}