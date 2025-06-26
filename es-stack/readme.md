# ELASTIC STACK AND GRAFANA

Configuration:
- Elastic Search run on the another host; its name in the ansible inventory ([`es-stack/inventory.yaml`][es-stack/inventory.yaml]) is `es`.
- Grafana and logstash can run either on the host or on the guest.
    - If you want it to run on the guest, use the yml files playbooks (`es-stack/*.yml`) to configure them.
    - If you want to run them locally, use the flag `--connection=local`

**Goal**:
Use Logstash to ingest the file `undertow_log.log` into ES and create a Grafana dashboard.
