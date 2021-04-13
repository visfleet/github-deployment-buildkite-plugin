# GitHub Deployment Buildkite Plugin

Creates GitHub Deployment before/after a Buildkite step is executed.

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: echo 'Deploy preview created'
    plugins:
      - ailohq/github-deployment#v1.0.7:
          # (optional) Names of env variables containing the username and personal access token with `repo_deployment` and `push` permissions.
          # By default set to `GITHUB_USERNAME` and `GITHUB_TOKEN`.
          username-env: GITHUB_USERNAME
          token-env: GITHUB_TOKEN
          # See https://docs.github.com/en/rest/reference/repos#create-a-deployment for description of the below
          ref: v1.0.0 # optional (default: git commit SHA hash)
          environment: qa # optional (default: "production")
          environment_url: https://dev.ailo.io # optional (default: null)
          production_environment: false # optional (default: `environment == "prod" || environment == "production"`)
          transient_environment: false # optional (default: false)
```

## Developing

To lint the `plugin.yml` file:

```sh
docker-compose run --rm lint
```

To run the tests:

```shell
docker-compose run --rm -e GITHUB_USERNAME=trunkbot -e GITHUB_TOKEN=abc123 tests
```

## Releasing

Bump the version in README example and publish it as a git tag.
