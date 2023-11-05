// usage: flowpipe pipeline run check_ips --pipeline-arg ip_address='["127.0.0.1", "76.76.21.21"]'
pipeline "check_ips" {
  title       = "Check Bulk IP Addresses"
  description = "Get information about IP addresses (v4 or v6)."

  param "ip_address" {
    type        = list(string)
    description = "The IPv4 or IPv6 address to check for reports."
  }

  step "http" "check_ips" {
    for_each = param.ip_address
    method   = "get"
    url      = "https://reallyfreegeoip.org/csv/${each.value}"
  }

  output "report_detailed" {
    description = "IP Report details with header."
    value = concat(
      ["IP,Country Code,Country Name,Region Code,Region Name,City,Zip Code,Time Zone,Latitude,Longitude,Metro Code"],
      [for ip_response in step.http.check_ips : trimsuffix(ip_response.response_body, "\r\n")]
    )
  }
}
