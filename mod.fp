mod "reallyfreegeoip" {
  title         = "Really Free GEO IP"
  description   = "Run pipelines to supercharge your Really Free GEO IP workflows using Flowpipe."
  color         = "#1ba16f"
  documentation = file("./README.md")
  icon          = "/images/mods/turbot/reallyfreegeoip.svg"
  categories    = ["library", "networking"]

  opengraph {
    title       = "Really Free GEO IP Mod for Flowpipe"
    description = "Run pipelines to supercharge your Really Free GEO IP workflows using Flowpipe."
    image       = "/images/mods/turbot/reallyfreegeoip-social-graphic.png"
  }

  require {
    flowpipe {
      min_version = "1.0.0"
    }
  }
}
