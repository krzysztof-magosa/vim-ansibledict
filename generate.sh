#!/bin/sh

ANSIBLE_VERSIONS=(
  "stable-2.5"
  "stable-2.6"
  "stable-2.7"
  "stable-2.8"
  "stable-2.9"
)

tmp=$(mktemp -d)
for version in ${ANSIBLE_VERSIONS[@]} ; do
  repo_dir="${tmp}/${version}"
  git clone https://github.com/ansible/ansible.git --branch=$version --depth=1 ${repo_dir}
  find ${repo_dir}/lib/ansible/modules/ -type f -iname "*.py" -print0 | \
    xargs -0 ./extract.py | \
    grep -v '^$' | \
    sort -u \
    > dicts/${version}.txt
done
rm -rf ${tmp}
