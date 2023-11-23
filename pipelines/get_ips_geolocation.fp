# usage: flowpipe pipeline run get_ips_geolocation --arg ip_address='["127.0.0.1", "76.76.21.21"]'
pipeline "get_ips_geolocation" {
  title       = "Check Bulk IP Addresses"
  description = "Get information about IP addresses (v4 or v6)."

  param "ip_address" {
    type        = list(string)
    description = "The IPv4 or IPv6 address to check for reports."
  }

  step "http" "get_ips_geolocation" {
    for_each = param.ip_address
    method   = "get"
    url      = "https://reallyfreegeoip.org/csv/${each.value}"
  }

  output "report" {
    description = "IP Report details with header."
    value = concat(
      ["IP,Country Code,Country Name,Region Code,Region Name,City,Zip Code,Time Zone,Latitude,Longitude,Metro Code"],
      [for ip_response in step.http.get_ips_geolocation : trimsuffix(ip_response.response_body, "\r\n")]
    )
  }
}
