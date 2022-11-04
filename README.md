# Container Debugging with tcpdump
## Build Docker Image
`docker build . -t tcpdump`

## Environment Variables
- `FILTER`: Configure Filters for `tcpdump`

## Running
`docker run --rm -it --env FILTER="tcp port 80" cfahrni/tcpdump`