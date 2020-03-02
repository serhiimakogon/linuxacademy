resource "aws_launch_configuration" "k8s_worker" {
  name            = "k8s_worker"
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = "100"
  }

  key_name = var.key_pair_name
  security_groups = [aws_security_group.admin.id]
}

resource "aws_autoscaling_group" "k8s_worker_asg" {
  name                      = "${var.project}-worker"
  launch_configuration      = aws_launch_configuration.k8s_worker.name
  vpc_zone_identifier       = var.vpc_zone_identifier
  min_size                  = 0
  max_size                  = 3
  desired_capacity          = 1
  //  load_balancers            = [aws_elb.k8s.name]
  termination_policies      = ["NewestInstance"]
  wait_for_capacity_timeout = 0
}