class ps_zendguard (

	$apache_modules_dir	= $ps_zendguard::params::apache_modules_dir,
	$apache_php_dir		= $ps_zendguard::params::apache_php_dir,

) inherits ps_zendguard::params {

	file { "${apache_modules_dir}":
		ensure => 'directory',
		mode => 750,
		owner => 'root',
	}
	
	file { "${apache_modules_dir}ZendGuardLoader-php-5.3-linux-glibc23-x86_64.so":
		ensure => present,
	    source => "puppet:///modules/ps_zendguard/ZendGuardLoader-php-5.3-linux-glibc23-x86_64.so",
	    subscribe => File["${apache_modules_dir}"]
	}
	
	file { "${apache_php_dir}conf.d/ps_zendguard.ini":
		ensure => present,
	    content => template("ps_zendguard/ps_zendguard.ini.erb"),
	    subscribe => File["${apache_modules_dir}ZendGuardLoader-php-5.3-linux-glibc23-x86_64.so"]
	}
	
	exec { "apache_restart":
    	command => "/etc/init.d/apache2 reload",
		refreshonly => true,
    	subscribe => File["${apache_php_dir}conf.d/ps_zendguard.ini"],
	}

}