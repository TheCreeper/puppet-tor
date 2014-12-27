class tor::config{

	$config_ensure = $tor::package_ensure ? {

		'absent' => 'absent',
		'purged' => 'absent',
		default => present,
	}

	$config_directory_ensure = $config_ensure ? {

		'absent' => 'absent',
		default => directory,
	}

	file { "${tor::configdir}":

		ensure => $config_directory_ensure,
		purge => $tor::config_purge,
		recurse => true,
		force => true,
		mode => '0755',
		owner => 'root',
		group => 'root',
	}->
	file { "${tor::configdir}/torrc":

		notify => Service[$tor::service_name],

		ensure=> $config_ensure,
		mode => '0644',
		owner => 'root',
		group => 'root',
		path => "${tor::configdir}/torrc",
		content => template('tor/etc/tor/torrc.erb'),
	}
}