# Define: ssh::client::host
#
# Apply a set of keywords to matching tokens.
#
# Examples:
#
#   ssh::client::host { 'elasticsearch':
#     hostname     => 'logs.example.com',
#     localforward => '5601:127.0.0.1:5601',
#     port         => '4200',
#   }
#
#   ssh::client::host { 'gateway':
#     hostname => '192.168.0.254',
#     user     => 'root',
#   }
#
define ssh::client::host (
  $addkeystoagent                  = undef,
  $addressfamily                   = undef,
  $batchmode                       = undef,
  $bindaddress                     = undef,
  $canonicaldomains                = undef,
  $canonicalizefallbacklocal       = undef,
  $canonicalizehostname            = undef,
  $canonicalizemaxdots             = undef,
  $canonicalizepermittedcnames     = undef,
  $certificatefile                 = undef,
  $challengeresponseauthentication = undef,
  $checkhostip                     = undef,
  $cipher                          = undef,
  $ciphers                         = undef,
  $clearallforwardings             = undef,
  $compression                     = undef,
  $compressionlevel                = undef,
  $connectionattempts              = undef,
  $connecttimeout                  = undef,
  $controlmaster                   = undef,
  $controlpath                     = undef,
  $controlpersist                  = undef,
  $dynamicforward                  = undef,
  $enablesshkeysign                = undef,
  $escapechar                      = undef,
  $exitonforwardfailure            = undef,
  $fingerprinthash                 = undef,
  $forwardagent                    = undef,
  $forwardx11                      = undef,
  $forwardx11timeout               = undef,
  $forwardx11trusted               = undef,
  $gatewayports                    = undef,
  $globalknownhostsfile            = undef,
  $gssapiauthentication            = undef,
  $gssapidelegatecredentials       = undef,
  $hashknownhosts                  = undef,
  $hostbasedauthentication         = undef,
  $hostbasedkeytypes               = undef,
  $hostkeyalgorithms               = undef,
  $hostkeyalias                    = undef,
  $hostname                        = undef,
  $identitiesonly                  = undef,
  $identityagent                   = undef,
  $identityfile                    = undef,
  $ignoreunknown                   = undef,
  $include                         = undef,
  $ipqos                           = undef,
  $kbdinteractiveauthentication    = undef,
  $kbdinteractivedevices           = undef,
  $kexalgorithms                   = undef,
  $localcommand                    = undef,
  $localforward                    = undef,
  $macs                            = undef,
  $nohostauthenticationforlocalhost= undef,
  $numberofpasswordprompts         = undef,
  $passwordauthentication          = undef,
  $permitlocalcommand              = undef,
  $pkcs11provider                  = undef,
  $port                            = undef,
  $preferredauthentications        = undef,
  $protocol                        = undef,
  $proxycommand                    = undef,
  $proxyjump                       = undef,
  $proxyusefdpass                  = undef,
  $pubkeyacceptedkeytypes          = undef,
  $pubkeyauthentication            = undef,
  $rekeylimit                      = undef,
  $remoteforward                   = undef,
  $requesttty                      = undef,
  $revokedhostkeys                 = undef,
  $rhostsrsaauthentication         = undef,
  $rsaauthentication               = undef,
  $sendenv                         = undef,
  $serveralivecountmax             = undef,
  $serveraliveinterval             = undef,
  $streamlocalbindmask             = undef,
  $streamlocalbindunlink           = undef,
  $stricthostkeychecking           = undef,
  $tcpkeepalive                    = undef,
  $tunnel                          = undef,
  $tunneldevice                    = undef,
  $updatehostkeys                  = undef,
  $useprivilegedport               = undef,
  $user                            = undef,
  $userknownhostsfile              = undef,
  $verifyhostkeydns                = undef,
  $versionaddendum                 = undef,
  $visualhostkey                   = undef,
  $xauthlocation                   = undef,
  Integer[30, 99] $order           = 30,

  Optional[String] $log_level      = undef, # underscore here because puppet
) {
  include ::ssh::client

  $valid_keywords = [
    'IgnoreUnknown', # Keep this at the beginning
    'AddKeysToAgent',
    'AddressFamily',
    'BatchMode',
    'BindAddress',
    'CanonicalDomains',
    'CanonicalizeFallbackLocal',
    'CanonicalizeHostname',
    'CanonicalizeMaxDots',
    'CanonicalizePermittedCNAMEs',
    'CertificateFile',
    'ChallengeResponseAuthentication',
    'CheckHostIP',
    'Cipher',
    'Ciphers',
    'ClearAllForwardings',
    'Compression',
    'CompressionLevel',
    'ConnectionAttempts',
    'ConnectTimeout',
    'ControlMaster',
    'ControlPath',
    'ControlPersist',
    'DynamicForward',
    'EnableSSHKeysign',
    'EscapeChar',
    'ExitOnForwardFailure',
    'FingerprintHash',
    'ForwardAgent',
    'ForwardX11',
    'ForwardX11Timeout',
    'ForwardX11Trusted',
    'GatewayPorts',
    'GlobalKnownHostsFile',
    'GSSAPIAuthentication',
    'GSSAPIDelegateCredentials',
    'HashKnownHosts',
    'HostbasedAuthentication',
    'HostbasedKeyTypes',
    'HostKeyAlgorithms',
    'HostKeyAlias',
    'HostName',
    'IdentitiesOnly',
    'IdentityAgent',
    'IdentityFile',
    'Include',
    'IPQoS',
    'KbdInteractiveAuthentication',
    'KbdInteractiveDevices',
    'KexAlgorithms',
    'LocalCommand',
    'LocalForward',
    #'LogLevel',
    'MACs',
    'NoHostAuthenticationForLocalhost',
    'NumberOfPasswordPrompts',
    'PasswordAuthentication',
    'PermitLocalCommand',
    'PKCS11Provider',
    'Port',
    'PreferredAuthentications',
    'Protocol',
    'ProxyCommand',
    'ProxyJump',
    'ProxyUseFdpass',
    'PubkeyAcceptedKeyTypes',
    'PubkeyAuthentication',
    'RekeyLimit',
    'RemoteForward',
    'RequestTTY',
    'RevokedHostKeys',
    'RhostsRSAAuthentication',
    'RSAAuthentication',
    'SendEnv',
    'ServerAliveCountMax',
    'ServerAliveInterval',
    'StreamLocalBindMask',
    'StreamLocalBindUnlink',
    'StrictHostKeyChecking',
    'TCPKeepAlive',
    'Tunnel',
    'TunnelDevice',
    'UpdateHostKeys',
    'UsePrivilegedPort',
    'User',
    'UserKnownHostsFile',
    'VerifyHostKeyDNS',
    'VersionAddendum',
    'VisualHostKey',
    'XAuthLocation',
  ]

  # Keywords that are joined by spaces in the presence of multiple
  # values
  $space_separated_keywords = [
    'GlobalKnownHostsFile',
    'IPQoS',
    'SendEnv',
    'UserKnownHostsFile',
  ]

  concat::fragment { "ssh_config-host-${name}":
    order   => $order,
    target  => $ssh::ssh_config,
    content => template('ssh/ssh_config-host.erb'),
  }
}
