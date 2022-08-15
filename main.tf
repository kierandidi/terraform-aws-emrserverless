resource "aws_emrserverless_application" "emr_application" {
    name = var.application_name
    release_label = "emr-6.6.0"
    type = "spark"

    maximum_capacity {
        cpu = var.application_max_cores
        memory = var.application_max_memory
    }

    initial_capacity {
        initial_capacity_type = "Driver"
        # no initial capacity provided, WARNING: if you provide initial capacity it will cost you even when you are not running a job
        # initial_capacity_config {
        #     worker_count = 1

        #     worker_configuration {
        #         cpu = "2 vCPU"
        #         memory = "10 GB"
        #     }
        # }
    }

    auto_start_configuration {
        # defaults
        enabled = "true"
    }

    auto_stop_configuration {
        # defaults
        enabled = "true"
        idle_timeout_minutes = 15
    }

    tags = {
        Name = var.application_name
    }
}

