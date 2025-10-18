# atlantis-test

Repo for testing https://github.com/runatlantis/atlantis.

It acts both as server (as being a place for running the atlantis binary) as well as repo (by being a place to create PRs).

## Setup

### Server

Server config is in `./server/`

gh token and ngrok token are both age encrypted, with the password in `~/.config/age/keys.txt` on my mac. Potentially make this configurable in the future.

The repos.yaml in `./server` acts as the "server side" Atlantis config.

### Repo

The root `atlantis.yaml` is for the "repo side" config. The terraform is in `project1/` (and potentially separate projects)

### State

The tf itself just creates terraform data, so doesn't need to access AWS. Additionally, instead of storing the state remotely, we use local state.

To make this work, after the apply happens, there's a workflow hook that commits the contents of the `terraform.tfstate` file, which we store per repo.

We also don't need terragrunt or any providers, just simple tf state to update.

## Running

Start ngrok with `./scripts/ngrok` to run the local proxy so github can get its webhooks to the local server, see https://github.com/runatlantis/atlantis/blob/main/CONTRIBUTING.md#running-atlantis-with-local-changes.

`./run` will make sure the webhook is setup correctly, then run atlantis from source.

