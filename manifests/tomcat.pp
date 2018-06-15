class { 'tomcat':
install_from 	=> 'package',
package_ensure 	=> 'latest',

java_home => '/usr/lib/jvm/jre',
java_opts 	=> ['-server', '-Xmx1024m', '-Xms128m', '-XX:+UseConcMarkSweepGC'],

admin_webapps        => true,
create_default_admin => true,
admin_user           => 'admin',
admin_password       => 'superpassword',

default_servlet_listings => true,
default_servlet_gzip     => true,
default_servlet_params   => { 'sendfileSize' => 64 },

}
tomcat::instance { 'tomcat':
  http_port           => 8080,
}
