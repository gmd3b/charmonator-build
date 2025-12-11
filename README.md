# Charmonator Build

Docker build configuration for https://github.com/CHARM-BDF/charmonator

## Building

Build the image using either:
```bash
docker build . -t charmonator
```

or with compose:
```bash
docker compose build
```

## Configuration

The application requires a configuration file at `/home/node/charmonator/conf/config.json`. On startup, the entrypoint script will:

1. Check if `conf/config.json` exists
2. If not, check for the `CHARMONATOR_CONFIG` environment variable and write its contents to the file
3. Otherwise, generate a default configuration using `scripts/generate-example-config.js`

### Using Environment Variables

Pass configuration as JSON via the `CHARMONATOR_CONFIG` environment variable:
```bash
export CHARMONATOR_CONFIG='{"default_system_message": "You are a helpful assistant.", ...}'
docker compose up
```

or in `docker-compose.yml`:
```yaml
services:
  charmonator:
    environment:
      - CHARMONATOR_CONFIG=${CHARMONATOR_CONFIG}
```

### Using Volume-Mapped Configuration

Create the `conf` directory before running to avoid permission issues:
```bash
mkdir -p conf
sudo chown -R 1000:1000 conf
```

Then run:
```bash
docker compose up
```

## Running

Start the service:
```bash
docker run -p 5002:5002 charmonator
```

or with compose:
```bash
docker compose up
```

The application will be available at `http://localhost:5002`
