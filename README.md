## go sample application on eks

### Required Tools:

* docker
* aws cli
* terraform  
* kubectl
* docker-compose
* goLang


#### Setup EKS

* Please follow below to launch EKS Cluster

```
git clone https://github.com/PavanDevops/go-sample-eks.git
cd go-sample-eks/infra/template
```

* Fill out the ``terraform.tfvars`` file with details.

* Run the below scripts to plan and create EKS Cluster:

```
./bin/tf-plan.sh
./bin/tf-apply.sh
```

#### Build, test and Deploy Application

###### Run Locally:
* to run locally:

```
docker-compose -f ./docker-compose.yml up -d
```

###### Run tests:
* to run tests:

```
docker-compose -f ./docker-compose.test.yml up -d
```

###### Deploy to EKS:
* Make sure to update image details in the following files before deploy to ECR:

Note: we can use kustomize to automate updating the Yaml files before deployment 

```
./kube-config/postgres-db-deploy.yaml
```


* Login to EKS (Make sure you logged into AWS CLi)
```
aws eks --region <region> update-kubeconfig --name <cluster_name>
```

* Deploy to EKS
```
kubectl apply -f ./kube-config/app-postgres-deployment.yaml \
            -f ./kube-config/postgres-db-deploy.yaml \
            -f ./kube-config/postgres-db-pv.yaml \
            -f ./kube-config/postgres-secret.yaml
```

#### IAM Policy to read and write to s3 and encrypt/Decrypt:

* IAM Policy config at ```./infra/modules/aws-iam```