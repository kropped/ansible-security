# vim: set ts=2 sw=2 ai et:

load options

# note: BATS does not respect this syntax: ${DATA_IMAGE}
@test "ansible 2.x is installed" {
  run docker run --volumes-from playbooks-data -t -i --entrypoint bash ansible-security -c "cd /opt/ansible; ansible --version"
  [[ ${output} =~ ansible\ 2\. ]]
}

@test "ansible playbook directory is available" {
 run docker run --volumes-from playbooks-data -t -i --entrypoint bash ansible-security -c "ls -l /etc/ansible"
  [[ ${output} =~ total ]]
}

@test "Go version 1.6.x is installed" {
 run docker run --volumes-from playbooks-data -t -i --entrypoint bash ansible-security -c "go version"
  [[ ${output} =~ go1.6\. ]]
}

@test "Autostager is installed in it's container" {
 run docker run --volumes-from playbooks-data -t -i --entrypoint bash autostager -c "pip list | grep autostager"
  [[ ${output} =~ autostager ]]
}
