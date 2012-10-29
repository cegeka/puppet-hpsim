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
        ensure => installed,
      }
      package { 'hp-OpenIPMI':
        ensure => installed,
      }
      package { 'hpsmh':
        ensure => installed,
      }
      package { 'hp-smh-templates':
        ensure => installed,
      }
      package { 'hp-snmp-agents':
        ensure => installed,
      }
      package { 'hpvca':
        ensure => installed,
      }
    }

    /^6./: {
      package { 'hp-health':
        ensure => installed,
      }
      package { 'hpsmh':
        ensure => installed,
      }
      package { 'hp-smh-templates':
        ensure => installed,
      }
      package { 'hp-snmp-agents':
        ensure => installed,
      }
      package { 'hpvca':
        ensure => installed,
      }
    }

    default: { notice("operatingsystemrelease ${::operatingsystemrelease} is not supported") }

  }

}
