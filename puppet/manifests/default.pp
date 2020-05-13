$use_proxy = lookup('http_proxy.use', Boolean)
$http_proxy = lookup('http_proxy.value', String)

if $use_proxy {
  notice ("Setting proxy to: $http_proxy")
  set_env {'http_proxy': value => $http_proxy }
}

include vbox_guest_additions
include xorg
include lightdm
include xfce

package { 'ttf-dejavu': ensure => 'present' }
package { 'mousepad': ensure => 'present' } # text editor
package { 'vim': ensure => 'present' } # text editor

package { 'arduino': ensure => 'present' }

exec { 'user_permissions_on_serial_port':
  command => '/usr/bin/usermod -a -G uucp vagrant'
}

package { 'firefox': ensure => 'present' }
package { 'git': ensure => 'present' }
package { 'thunar-archive-plugin': ensure => 'present' }
package { 'xarchiver': ensure => 'present' }
package { 'unzip': ensure => 'present' }
package { 'zip': ensure => 'present' }