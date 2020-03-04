### Setup

Perform the following steps for this setup  
1. Create the project petclinic in your openshift console.   
2. Update the secret.xlvals with your token
3. Update the infra.yaml with your openshift endpoint
4. Download the xl cli choosing the right version for your platform and XL Deploy version https://dist.xebialabs.com/public/xl-cli/
5. Make sure XL Deploy is running 
6. Run this command ``` xl apply -f infra.yaml ```   
7. Run this command ``` xl apply -f env.yaml ```    
