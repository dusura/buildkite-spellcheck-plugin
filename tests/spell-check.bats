#!/usr/bin/env bats

setup() {
  load "$BATS_PLUGIN_PATH/load.bash"

# Uncomment to enable stub debugging
# export GIT_STUB_DEBUG=/dev/tty
}



@test "spell check" {

#  stub run-spell-check ': echo 6 spelling errors found in 1 file'
  stub docker 'run --rm -ti -v .:/workdir tmaier/markdown-spellcheck:latest --report "**/*.md" : echo 5 spelling errors found in 1 file'
#stub buildkite-agent 'annotate "Found 1 files matching *.bats" : echo Annotation created'


  run $PWD/spell-check.sh .

  assert_success
  assert_output --partial "6 spelling errors found in 1 file"
  unstub run-spell-check
}
