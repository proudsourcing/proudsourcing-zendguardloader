class ps_zendguardloader (

	$apache_modules_dir	= $ps_zendguardloader::params::apache_modules_dir,
	$apache_php_dir		= $ps_zendguardloader::params::apache_php_dir,
	$php_version		= $ps_zendguardloader::params::php_version,

) inherits ps_zendguardloader::params {

	file { "${apache_modules_dir}":
		ensure => 'directory',
		mode => 750,
		owner => 'root',
	}
	
	file { "${apache_modules_dir}ZendGuardLoader-php-${php_version}-linux-glibc23-x86_64.so":
		ensure => present,
	    source => "puppet:///modules/ps_zendguardloader/ZendGuardLoader-php-${php_version}-linux-glibc23-x86_64.so",
	    subscribe => File["${apache_modules_dir}"]
	}
	
	if $php_version == "5.5" or $php_version == "5.6" {
		file { "${apache_modules_dir}opCache-php-${php_version}-linux-glibc23-x86_64.so":
			ensure => present,
	    	source => "puppet:///modules/ps_zendguardloader/opCache-php-${php_version}-linux-glibc23-x86_64.so",
		}
	}
	
	file { "${apache_php_dir}conf.d/ps_zendguardloader.ini":
		ensure => present,
	    content => template("ps_zendguardloader/ps_zendguardloader.ini.erb"),
	    subscribe => File["${apache_modules_dir}ZendGuardLoader-php-${php_version}-linux-glibc23-x86_64.so"]
	}
	
	exec { "apache_restart-zgl":
    	command => "/etc/init.d/apache2 reload",
		refreshonly => true,
    	subscribe => File["${apache_php_dir}conf.d/ps_zendguardloader.ini"],
	}

}