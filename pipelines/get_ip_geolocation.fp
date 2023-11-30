# usage: flowpipe pipeline run get_ip_geolocation --arg ip_address="76.76.21.21"
pipeline "get_ip_geolocation" {
  title       = "Get IP Geolocation"
  description = "Get geolocation data for an IPv4 or IPv6 address."

  param "ip_address" {
    type        = string
    description = "The IPv4 or IPv6 address."
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

  output "geolocation" {
    description = "IP geolocation details."
    value       = step.http.get_ip_geolocation.response_body
  }
}
