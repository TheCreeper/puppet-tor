class tor (

	$package_ensure = latest,
	$package_name = 'tor',

	$service_manage = true,
	$service_enable = true,
	$service_ensure = running,
	$service_name = 'tor',

	$config_purge = true,
	$configdir = '/etc/tor',

	$socksport = ['9050'],
	$sockspolicy = ['accept 127.0.0.0/8', 'reject *'],
	$lognotice = 'notice syslog',
	$runasdaemon = undef,
	$datadirectory = '/var/lib/tor',
	$controlport = undef,
	$controlsocket = '/var/run/tor/control',
	$controlsocketgroupreadable = '1',
	$hashedcontrolpassword = undef,
	$cookieauthentication = undef,
	$cookieauthfile = '/var/run/tor/control.authcookie',
	$hiddenservicedir = undef,
	$hiddenserviceport = [],
	$orport = undef,
	$address = undef,
	$outboundbindaddress = undef,
	$relaybandwidthrate = undef,
	$relaybandwidthburst = undef,
	$accountingstart = undef,
	$dirport = undef,
	$dirportfrontpage = undef,
	$myfamily = undef,
	$exitpolicy = ['reject *:*'],
	$bridgerelay = undef,
	$publishserverdesciptor = undef,
	$circuitbuildtimeout = undef,
	$keepaliveperiod = undef,
	$newcircuitperiod = undef,
	$numentryguards = undef,
	$dnsport = undef,
	$automaphostsonresolve = undef,
	$automaphostssuffixes = [],
	$excludeexitnodes = [],
) {

	validate_string($package_ensure)
	validate_string($package_name)

	validate_bool($service_manage)
	validate_bool($service_enable)
	validate_string($service_ensure)
	validate_string($service_name)

	validate_bool($config_purge)
	validate_absolute_path($configdir)

	validate_array($socksport)
	validate_array($sockspolicy)
	validate_string($lognotice)
	validate_string($runasdaemon)
	validate_absolute_path($datadirectory)
	validate_string($controlport)
	validate_string($hashedcontrolpassword)
	validate_string($cookieauthentication)
	validate_absolute_path($cookieauthfile)
	validate_string($hiddenservicedir)
	validate_array($hiddenserviceport)
	validate_string($orport)
	validate_string($address)
	validate_string($outboundbindaddress)
	validate_string($relaybandwidthrate)
	validate_string($relaybandwidthburst)
	validate_string($accountingstart)
	validate_string($dirport)
	validate_string($circuitbuildtimeout)
	validate_string($keepaliveperiod)
	validate_string($newcircuitperiod)
	validate_string($numentryguards)
	validate_string($dnsport)
	validate_string($automaphostsonresolve)
	validate_array($automaphostssuffixes)
	validate_array($excludeexitnodes)

	if $dirportfrontpage {

		validate_absolute_path($dirportfrontpage)
	}

	validate_array($exitpolicy)
	validate_string($bridgerelay)
	validate_string($publishserverdesciptor)

	class{ 'tor::install': }->
	class{ 'tor::config': }->
	class{ 'tor::service': }
}
