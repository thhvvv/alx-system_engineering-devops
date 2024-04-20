# Define variables for package name and version
$package_name = 'flask'
$package_version = '2.1.0'

# Install Flask using pip3
package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask':
  command => "/usr/bin/pip3 install ${package_name}==${package_version}",
  path    => '/usr/bin',
  creates => "/usr/local/lib/python3.x/dist-packages/${package_name}-${package_version}-py3.x.egg-info",
  require => Package['python3-pip'],
}
