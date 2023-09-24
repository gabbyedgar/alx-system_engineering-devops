# Kill a process with the unfortunate name `killmenow`
exec { 'kill killmenow':
  command => '/usr/bin/pkill -f killmenow'
}
