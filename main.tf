///module "networking" {
 //   source    = "./aws-networking" 
 // }

  
//module "projetodevops" {
//source       = "./aws-eks-jenkins-ec2"
//}


//module "networking" {
//source    = "./aws-cluster-ecs" 
//}


//module "aws-jenkins" {
//source    = "./aws-eks-jenkins-ec2" 
///}

//module "cluster-elb-fargate" {
//source    = "./aws-cluster-ecs" 
//}


//module "projetofinal" {
//source    = "./aws-projetofinal" 
//}

module "sonarqube-fargate" {
source    = "./aws-fargate-sonarcloud" 
}



