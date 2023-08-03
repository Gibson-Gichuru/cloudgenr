# Adding EFS provisioner Helm Chart Repository

helm repo add aws-efs-csi-driver https://kubernetes-sigs.github.io/aws-efs-csi-driver
helm repo update


# installing EFS Provisiioer using Helm

helm install efs-provisioner aws-efs-csi-driver/aws-efs-csi-driver \
  --namespace kube-system \
  --set enableIAM=true

# Verifying EFS provisioner deployment
kubectl get pods -n kube-system | grep efs-provisioner

# Verifying efs-proviisoner is installed
kubectl get deployments -n kube-system

# Creating Storage class and Persistant Volume
kubectl apply -f efs-storageclass.yaml

..............................
# Setting up kubeconfig to access the eks created earlier
  aws eks --region REGION update-kubeconfig --name my-eks

  aws eks update-kubeconfig --name <cluster-name>

kubectl config view
kubectl get node

# Deployng Wordpress to EKS
# Add helm repo to the environment
helm repo add my-repo https://charts.bitnami.com/bitnami

# Installing helm chart for wordpress
helm install my-release my-repo/wordpress --set wordpressPassword=password

# After deplyment check pods
kubectl get pods

