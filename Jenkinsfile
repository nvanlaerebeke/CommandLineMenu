pipeline {
  agent {
    kubernetes {
      yaml '''
kind: Pod
metadata:
  name: dotnet
spec:
  containers:
  - name: dotnet
    image: mcr.microsoft.com/dotnet/sdk:latest
    imagePullPolicy: Always
    tty: true
    command:
    - sleep
    - infinity
    volumeMounts:
      - name: nuget-secret
        mountPath: /etc/nuget-secret    
  volumes:
    - name: nuget-secret
      secret:
        secretName: nuget-secret    
'''
    }

  }
  stages {
    stage('build') {
      steps {
        container(name: 'dotnet') {
          sh '''#!/bin/bash
echo "Building the app"          
dotnet build src/CommandLineMenu/CommandLineMenu/CommandLineMenu.csproj -c Release

REGISTRY=`cat /etc/nuget-secret/apiUrl`
APIKEY=`cat /etc/nuget-secret/apiKey`

dotnet nuget push src/CommandLineMenu/bin/Release/*.nupkg -s "$REGISTRY" -k "$APIKEY"
          '''
        }        
      }
    }

  }
}