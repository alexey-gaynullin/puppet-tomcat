class{ 'nginx' :
    manage_repo 	     => true,
    package_source 	     => 'nginx-mainline'
}
nginx::resource::server { 'slave-pp.local':
        listen_port 	     => 8888,
        ensure               => present,
        server_name          => ['slave-pp.local slave-pp'],
        proxy 	             => 'http://10.191.0.101:8080',
}
