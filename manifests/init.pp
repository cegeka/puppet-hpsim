# Class: hpsim
#
# This module manages hpsim
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class hpsim (
  $sut_mode
) {
  case $facts['os']['release']['major'] {
    /5/: {
      package { [ 'hp-health', 'hp-OpenIPMI', 'hp-snmp-agents', 'hpvca' ]:
        ensure => installed,
      }
    }

    /6/: {
      package { [ 'hp-health', 'hp-snmp-agents', 'hpvca' ]:
        ensure => installed,
      }
    }

    /7|8/: {
      if $::is_hp_gen10 {
        $ams_package_name = 'amsd'  # hp_gen10 uses iLO5 which requires package amsd instead of hp-ams
      } else {
        $ams_package_name = 'hp-ams'
      }
      package { [ 'hp-health', 'hp-snmp-agents', $ams_package_name, 'hponcfg', 'sut' ]:
        ensure => installed,
      } ~> exec {'/usr/bin/sleep 10':
        refreshonly => true,
      } ~> exec {"/sbin/sut -set mode=${sut_mode}":
        path        => '/usr/local/bin:/bin:/sbin:/usr/local/sbin',
        refreshonly => true,
      }
    }
    default: { notice("operatingsystemrelease ${facts['os']['release']['full']} is not supported") }
  }

  # kmod-hpvsa is only available for lower kernel versions, oracle uses a newer kernel so this module is useless on those
  if $facts['os']['name'] != 'OracleLinux' and $facts['os']['release']['major'] == '7' {
    package { 'kmod-hpvsa':
      ensure => installed,
    }
  }

  if !$::is_hp_gen10 {
    package { ['hpsmh', 'hp-smh-templates']:
      ensure => installed,
    }
  }
}
