#!/usr/bin/env bats

setup() {
  load "$BATS_PLUGIN_PATH/load.bash"

# Uncomment to enable stub debugging
# export GIT_STUB_DEBUG=/dev/tty
}



@test "spell check" {
  # given
  stub docker 'run --rm -ti -v .:/workdir tmaier/markdown-spellcheck:latest --report "**/*.md" : echo 6 spelling errors found in 1 file'
  stub buildkite-agent 'annotate : cat -'

  # when
  run $PWD/spell-check.sh .

  # then
  assert_output --partial "term"
  assert_output --partial "6 spelling errors found in 1 file"
  assert_success

  # cleanup
  unstub buildkite-agent
  unstub docker
}
