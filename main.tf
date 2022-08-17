resource "aws_emrserverless_application" "emr_application" {
  name          = var.application_name
  release_label = "emr-6.6.0"
  type          = "spark"

  maximum_capacity {
    cpu    = var.application_max_cores
    memory = var.application_max_memory
  }

  initial_capacity {
    initial_capacity_type = "Driver"

    dynamic "initial_capacity_config" {
      for_each = var.initial_worker_count == null ? [] : [1]

      content {
        worker_count = var.initial_worker_count

        dynamic "worker_configuration" {
          for_each = [1] #?

          content {
            cpu    = var.initial_worker_cpu
            memory = var.initial_worker_memory
          }
        }
      }
    }
  }

  auto_start_configuration {
    # defaults
    enabled = "true"
  }

  auto_stop_configuration {
    # defaults
    enabled              = "true"
    idle_timeout_minutes = 15
  }

  tags = {
    Name = var.application_name
  }
}

