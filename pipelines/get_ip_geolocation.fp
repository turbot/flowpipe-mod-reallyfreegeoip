# usage: flowpipe pipeline run get_ip_geolocation --arg ip_address='127.0.0.1'
pipeline "get_ip_geolocation" {
  title       = "Check IP Address"
  description = "Get information about an IP address (v4 or v6)."

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

  step "http" "get_ip_geolocation" {
    method = "get"
    url    = "https://reallyfreegeoip.org/${param.format}/${param.ip_address}"
  }

  output "report" {
    description = "IP report details."
    value       = step.http.get_ip_geolocation.response_body
  }
}
