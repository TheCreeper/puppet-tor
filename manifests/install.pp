class tor::install {

	package { $tor::package_name:

		ensure => $tor::package_ensure,
	}
}