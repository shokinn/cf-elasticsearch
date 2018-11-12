## Run single-node ElasticSearch as an app in CloudFoundry

Sometimes you need elasticsearch for development purposes - this app will do that.

### Setup

Run `./setup.sh` to download the JDK and ES binaries. Adjust which version of JDK and ES are downloaded by modifying the script.

### Adjust `manifest.yml`

```
---
applications:
- name: smalik-elasticsearch
  buildpack: binary_buildpack
  command: ./start.sh
  path: .
  instances: 1
  disk_quota: 2G
  memory: 1G
  env:
    ES_JAVA_OPTS: "-Xms512m -Xmx512m"
```

The `manifest.yml` specifies the app name, disk quota, and memory availble to the container. The `ES_JAVA_OPTS` should be set to 1/2 the availble memory allocated for the container. Only the REST interface of ES will be exposed by CF.

### Runing in CF

```
cf push
```

