# Create temporary file called holberton
file { '/tmp/holberton':
  ensure  => 'present',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
  content => 'I love Puppet'
}
