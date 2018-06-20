package { 'policycoreutils':
	ensure => installed,
}
exec { 'add_se_rule':
        command 	=> '/usr/sbin/semanage port -a -t http_port_t -p tcp 8888',
        unless   	=> '/usr/sbin/semanage port -l | /usr/bin/grep -E ^http_port_t.*8888',
}
class{ 'nginx' :
	require => Exec['add_se_rule'],
	manage_repo 	     => true,
	package_source 	     => 'nginx-mainline',
}
nginx::resource::server { 'slave-pp.local':
        listen_port 	     => 8888,
        ensure               => present,
        server_name          => ['slave-pp.local slave-pp'],
	proxy 	             => "http://${facts['networking']['ip']}:8080",
}
