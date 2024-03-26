#!/usr/bin/env bash
# using puppet to connect without password
file { '/etc/ssh/sshd_config':
  ensure => present,
}

file_line { 'Configure SSH to use private key':
  path    => '/etc/ssh/sshd_config',
  line    => 'IdentityFile ~/.ssh/school',
  match   => '^#IdentityFile',
}

file_line { 'Configure SSH to refuse password authentication':
  path    => '/etc/ssh/sshd_config',
  line    => 'PasswordAuthentication no',
  match   => '^#PasswordAuthentication',
}
