trigger "schedule" "daily_3pm" {
  title       = "Schedule"
  description = "Schedule a pipeline to run every day at 3pm."
  pipeline    = pipeline.get_ip_geolocation
  schedule    = "* 15 * * *"

  documentation = "## Testing trigger MD"


  tags = {
    type = "test_trigger"
  }

  args = {
    ip_address = "24.185.201.16"
  }
}

trigger "http" "my_webhook" {
  title       = "Webhook"
  description = "Create a webhook trigger."
  pipeline    = pipeline.get_ip_geolocation

  tags = {
    type = "test_trigger"
  }

  args  = {
    ip_address = "24.185.201.17"
  }
}

/*
trigger "http" "my_webhook_methods" {
  title       = "Webhook with Methods"
  description = "Create a webhook trigger with different methods."

  method "post" {
    pipeline = pipeline.get_ip_geolocation

    args = {
      ip_address = "24.185.201.17"
    }
  }

  method "get" {
    execution_mode = "synchronous"
    pipeline       = pipeline.get_ip_geolocation

    args = {
      ip_address = "24.185.201.17"
    }
  }
}
*/
