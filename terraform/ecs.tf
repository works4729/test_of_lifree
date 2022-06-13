# front
resource "aws_ecs_cluster" "lifree-ecs-cluster" {
    name = "lifree-ecs-cluster"
}

resource "aws_ecs_task_definition" "lifree-front-task" {
    family = "lifree-front-task"
    cpu = "256"
    memory = "512"
    network_mode = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    container_definitions = file("./tasks/lifree_front_definition.json")
    execution_role_arn = module.ecs_task_execution_role.iam_role_arn
}

resource "aws_ecs_service" "lifree-front-ecs-service" {
    name = "lifree-front-ecs-service"
    cluster = aws_ecs_cluster.lifree-ecs-cluster.arn
    task_definition = aws_ecs_task_definition.lifree-front-task.arn
    desired_count = 1
    launch_type = "FARGATE"
    platform_version = "1.4.0"
    health_check_grace_period_seconds = 600
    
    network_configuration {
      assign_public_ip = true
      security_groups = [
        aws_security_group.lifree-ecs-sg.id
    ]
    subnets = [
      aws_subnet.lifree-public-1a.id,
      aws_subnet.lifree-public-1c.id
    ]
  }

    load_balancer {
      target_group_arn = aws_lb_target_group.lifree-alb-front-tg.arn
      container_name   = "front-container"
      container_port   = "80"
    }
}

# api
resource "aws_ecs_task_definition" "lifree-api-task" {
  family                   = "lifree-api-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/lifree_api_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
resource "aws_ecs_service" "lifree-api-ecs-service" {
  name             = "lifree-api-ecs-service"
  cluster          = aws_ecs_cluster.lifree-ecs-cluster.arn
  task_definition  = aws_ecs_task_definition.lifree-api-task.arn
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "1.4.0"

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.lifree-ecs-sg.id
    ]
    subnets = [
      aws_subnet.lifree-public-1a.id,
      aws_subnet.lifree-public-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.lifree-alb-api-tg.arn
    container_name   = "api-container"
    container_port   = "3000"
  }
}

# db
resource "aws_ecs_task_definition" "db-create" {
  family                   = "lifree-db-create"
  container_definitions    = file("./tasks/lifree_db_create_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
resource "aws_ecs_task_definition" "db-migrate" {
  family                   = "lifree-db-migrate"
  container_definitions    = file("./tasks/lifree_db_migrate_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
resource "aws_ecs_task_definition" "db-migrate-reset" {
  family                   = "lifree-db-migrate-reset"
  container_definitions    = file("./tasks/lifree_db_migrate_reset_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecs_task_execution" {
  source_json = data.aws_iam_policy.ecs_task_execution_role_policy.policy

  statement {
    effect    = "Allow"
    actions   = ["ssm:GetParameters", "kms:Decrypt"]
    resources = ["*"]
  }
}

module "ecs_task_execution_role" {
  source     = "./modules/iam_role"
  name       = "ecs-task-execution"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task_execution.json
}