locals {
  front_end_instance_name = "${var.project_name}-front-${var.environment}"
  back_end_instance_name = "${var.project_name}-back-${var.environment}"
  
  front_end_repository_name = "${var.project_name}-front"
  back_end_repository_name = "${var.project_name}-back"
}