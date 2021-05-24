#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "Successfully calls GitHub Deployment API" {
  export BUILDKITE_REPO=git@github.com:ailohq/github-deployment-buildkite-plugin.git
  export BUILDKITE_COMMIT=6a1afef54b9f8e9bd3378751bd5c698e3049a2f7
  export BUILDKITE_BUILD_ID=test-buildkite-build-id
  export BUILDKITE_BUILD_URL=https://buildkite.com/ailohq/github-deployment-buildkite-plugin/builds/test-buildkite-build-id
  export BUILDKITE_COMMAND_EXIT_STATUS=0

  stub buildkite-agent  \
    "meta-data get "environment_url" --default "" : true"

  run "$PWD/hooks/post-command"

  assert_success

  unstub buildkite-agent
}