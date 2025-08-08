## TensorZero E2E Helpers

A small set of `just` recipes to check a local TensorZero Gateway, run end-to-end tests, and smoke-test direct calls to Llama.

### Prerequisites
- Rust and Cargo installed
- `just` task runner installed
- `curl`
- A running TensorZero Gateway at `TENSORZERO_GATEWAY_URL` (default: `http://localhost:3000`)
- ClickHouse available if the gateway requires it
- Access to a Llama API key

### Environment
Set these in your shell (recommended) before running any recipes:

```bash
export TENSORZERO_GATEWAY_URL="http://localhost:3000"
# Example ClickHouse URL format
export TENSORZERO_CLICKHOUSE_URL="http://default:deadbeef@localhost:8123/tensorzero"
# Required for Llama calls
export LLAMA_API_KEY="sk-..."
# Path to your tensorzero repo root
export tensor_root="$HOME/src/tensorzero"
```

Notes:
- The `just` file uses the values from your environment. You can override them per-invocation as usual with environment vars.
- `tensor_root` must point to a valid checkout of the `tensorzero` repository because the recipes `cd` into it and run Cargo commands there.

### Quick start
- Verify environment variables:
```bash
just check-env
just check-gateway-env
```
- Check if the gateway is up:
```bash
just check-gateway
```
- Run the end-to-end binary:
```bash
just run-e2e-run
```
- Run all e2e tests against Llama provider:
```bash
just run-e2e-test
```
- Fail-fast, no retries:
```bash
just mia-test
```
- Fail-fast, no retries (broad test selector):
```bash
just bwl-test-ff
```
- Narrow test selection with debug logs:
```bash
just mia-test-narrow
```

### Direct Llama smoke test
Create a `llama-post-data.json` next to your `justfile` (or run from that directory):

```json
{
  "model": "llama-3.1-8b-instruct",
  "messages": [
    { "role": "system", "content": "You are a helpful assistant." },
    { "role": "user", "content": "Say hello in one sentence." }
  ],
  "temperature": 0.2
}
```

Then run:
```bash
just raw-llama
```
This sends the JSON payload to `https://api.llama.com/v1/chat/completions` using your `LLAMA_API_KEY`.

### Recipe reference
- `check-env`: Prints the key environment variables to confirm they’re set
- `check-gateway-env`: Confirms gateway-related env vars including ClickHouse and Llama key
- `check-gateway`: `GET $TENSORZERO_GATEWAY_URL/status` to verify the gateway is reachable
- `run-e2e-run`: Runs the e2e binary with `RUST_LOG=info`
- `run-e2e-test`: Runs `cargo test-e2e providers::llama`
- `mia-test`: Runs e2e tests fail-fast, no retries, against Llama
- `bwl-test-ff`: Runs e2e tests fail-fast, no retries (all suites)
- `mia-test-narrow`: Runs a single focused test with `RUST_LOG=debug`
- `raw-llama`: Posts `llama-post-data.json` to Llama’s chat completions API

### Troubleshooting
- 401 or auth errors: Ensure `LLAMA_API_KEY` is set and valid
- Gateway 4xx/5xx: Ensure the gateway is running and `TENSORZERO_GATEWAY_URL` is correct
- ClickHouse errors: Verify `TENSORZERO_CLICKHOUSE_URL` format and connectivity
- Cargo not finding tests/targets: Confirm `tensor_root` points to the correct `tensorzero` checkout

