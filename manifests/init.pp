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
class hpsim {

  case $::operatingsystemrelease {

    /^5./: {
      package { 'hp-health':
        ensure => '8.5.0.23-23',
      }
      package { 'hp-OpenIPMI':
        ensure => '8.5.0-1',
      }
      package { 'hpsmh':
        ensure => '6.1.0-103',
      }
      package { 'hp-smh-templates':
        ensure => '8.5.0.13-15',
      }
      package { 'hp-snmp-agents':
        ensure => '8.5.0.17-19',
      }
      package { 'hpvca':
        ensure => '6.1.0-7',
      }
    }

    /^6./: {
      package { 'hp-health':
        ensure => '8.6.2.2-14',
      }
      package { 'hpsmh':
        ensure => '6.2.1-14',
      }
      package { 'hp-smh-templates':
        ensure => '8.6.0.14',
      }
      package { 'hp-snmp-agents':
        ensure => '8.6.2.3-9',
      }
      package { 'hpvca':
        ensure => '6.2.1-1',
      }
    }

    default: { notice("operatingsystemrelease ${::operatingsystemrelease} is not supported") }

  }

}
