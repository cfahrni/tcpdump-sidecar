# Container Debugging with tcpdump
## Build Docker Image
`docker build . -t tcpdump`

## Environment Variables
- `FILTER`: Configure Filters for `tcpdump`

## Run Docker Container
`docker run --rm -it --env FILTER="tcp port 80" cfahrni/tcpdump`

## Run Container in Kubernetes
### Create Patch
```bash
cat <<EOF >patch.yaml
spec:
  template:
    spec:
      containers:
      - name: tcpdumper
        image: cfahrni/tcpdump:latest
      env:
      - name: FILTER
        value: "tcp port 80 and host 10.0.10.25"
EOF
```
### Apply patch
```kubectl patch deployments.apps helloworld --patch "$(cat patch.yml)"```

### Analyze traffic
```kubectl attach deployment/helloworld -c tcpdumper```

## Undo changes / rollback
```kubectl rollout undo deployment/helloworld```