class tor::config{

	file { "${tor::configdir}/torrc":

		notify => Service[$tor::service_name],

		ensure=> present,
		mode => '0644',
		owner => 'root',
		group => 'root',
		path => "${tor::configdir}/torrc",
		content => template('tor/torrc.erb'),
	}
}