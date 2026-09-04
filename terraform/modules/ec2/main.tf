resource "aws_launch_template" "bastion" {
  count = var.create_bastion ? 1 : 0

  name = "${var.environment}-bastion-template"

  instance_type = var.instance_type

  image_id = var.ami_id

  iam_instance_profile {
    name = var.instance_profile_name
  }

  monitoring {
    enabled = true
  }

  # Enforce IMDSv2
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  # Encrypted root volume
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.root_volume_size
      volume_type           = "gp3"
      encrypted             = true
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "${var.environment}-bastion"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}


resource "aws_instance" "bastion" {
  count = var.create_bastion ? 1 : 0

  subnet_id = var.subnet_id

  launch_template {
    id      = aws_launch_template.bastion[0].id
    version = aws_launch_template.bastion[0].latest_version
  }

  tags = {
    Name        = "${var.environment}-bastion"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}