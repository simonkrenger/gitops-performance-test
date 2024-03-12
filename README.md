# argocd stresstest
Argocd has issues when managing more than 100 namespaces.
This issue incl workarounds is tracked here: https://access.redhat.com/solutions/7006291

## Purpose
The intention of this repository is to simulate such a situation for testing the mentioned workarounds

## Prerequirements
- Openshift 4.12.46
- openshift-gitops-1.11

## Setup
1. generate some instance ids that can be used later by the appset to create multiple instances (if there are none in instances/)  
`./generate-instances.sh`
- Commit and Push to your git repository

2. Create namespaces with appropiate label (scoped argocd is not able to create namespace by itself)  
`./create-namespaces.sh`

3. Create the argocd instance  
- Replace CHANGEME occurances in argocd.yaml and appset.yaml  
- Add the source repository and privatekey as a secret  
`oc kustomize argocd-instance/base | oc apply -f-`
