// usage: flowpipe pipeline run check_ip --pipeline-arg ip_address='127.0.0.1'
pipeline "check_ip" {
  title       = "Check IP Address"
  description = "Get information about an IP (v4 or v6)."

  param "ip_address" {
    type        = string
    description = "The IPv4 or IPv6 address to check for reports."
  }

  param "format" {
    type        = string
    optional    = true
    default     = "json"
    description = "The format of the output. Accepted values are json, csv and xml. Defaults to json."
  }

  step "http" "check_ip" {
    method = "get"
    url    = "https://reallyfreegeoip.org/${param.format}/${param.ip_address}"
  }

  output "report" {
    description = "IP Report details."
    value       = step.http.check_ip.response_body
  }
}
