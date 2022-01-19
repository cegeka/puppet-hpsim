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
  case $::operatingsystemmajrelease {
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
      package { [ 'hp-health', 'hp-snmp-agents', 'kmod-hpvsa', "$ams_package_name", 'hponcfg' ]:
        ensure => installed,
      }
      package { 'sut':
        ensure => installed,
      } ~> exec {"/sbin/sut -set mode=${sut_mode}":
        refreshonly => true,
      }
    }
    default: { notice("operatingsystemrelease ${::operatingsystemrelease} is not supported") }
  }

  if !$::is_hp_gen10 {
    package { ['hpsmh', 'hp-smh-templates']:
      ensure => installed,
    }
  }
}
