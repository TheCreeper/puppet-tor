class tor::service {

	if !($tor::service_ensure in [ 'running', 'stopped' ]) {

		fail('service_ensure parameter must be running or stopped')
	}

	if $tor::service_manage == true {

		service { $tor::service_name:

			enable => $tor::service_enable,
			ensure => $tor::service_ensure,
		}
	}
}