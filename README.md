# Really Free GEO IP Mod for Flowpipe

Really Free GEO IP pipeline library of [Flowpipe](https://flowpipe.io) enabling seamless integration of Really Free GEO IP services into your workflows.

## Documentation

- **[Pipelines →](https://hub.flowpipe.io/mods/turbot/reallyfreegeoip/pipelines)**

## Getting started

### Installation

Download and install Flowpipe (https://flowpipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install flowpipe
```

### Credentials

No credentials are required.

### Usage

[Initialize a mod](https://flowpipe.io/docs/build/index#initializing-a-mod):

```sh
mkdir my_mod
cd my_mod
flowpipe mod init
```

[Install the Really Free GEO IP mod](https://flowpipe.io/docs/build/mod-dependencies#mod-dependencies) as a dependency:

```sh
flowpipe mod install github.com/turbot/flowpipe-mod-reallyfreegeoip
```

[Use the dependency](https://flowpipe.io/docs/build/write-pipelines/index) in a pipeline step:

```sh
vi my_pipeline.fp
```

```hcl
pipeline "my_pipeline" {

  step "pipeline" "get_ip_geolocation" {
    pipeline = reallyfreegeoip.pipeline.get_ip_geolocation
    args = {
      ip_address = "76.76.21.21"
    }
  }
}
```

[Run the pipeline](https://flowpipe.io/docs/run/pipelines):

```sh
flowpipe pipeline run my_pipeline
```

### Developing

Clone:

```sh
git clone https://github.com/turbot/flowpipe-mod-reallyfreegeoip.git
cd flowpipe-mod-reallyfreegeoip
```

List pipelines:

```sh
flowpipe pipeline list
```

Run a pipeline:

```sh
flowpipe pipeline run get_ip_geolocation --arg ip_address='76.76.21.21'
```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Flowpipe](https://flowpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #flowpipe on Slack →](https://flowpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Flowpipe](https://github.com/turbot/flowpipe/labels/help%20wanted)
- [Really Free GEO IP Library Mod](https://github.com/turbot/flowpipe-mod-reallyfreegeoip/labels/help%20wanted)
