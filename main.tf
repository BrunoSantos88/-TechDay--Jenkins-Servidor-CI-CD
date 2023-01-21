//module "projetodevops" {
//source       = "./projeto"
//}

//module "helmjenkins" {
//source    = "./helmprojeto" 

//}

//module "eksbasic" {
//source    = "./eksprojeto" 

//}

//module "fargate-jlve" {
//source    = "./aws-ecs-fargate-jenkis-slave" 

//}

module "SonarRDS" {
source    = "./aws-ecs-fargate-sonar-rds" 

}

