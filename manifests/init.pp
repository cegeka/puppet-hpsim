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

  case $::operatingsystemmajrelease {
    /5/: {
      package { [ 'hp-health', 'hp-OpenIPMI', 'hpsmh', 'hp-smh-templates', 'hp-snmp-agents', 'hpvca' ]:
        ensure => installed,
      }
    }

    /6/: {
      package { [ 'hp-health' , 'hpsmh', 'hp-smh-templates', 'hp-snmp-agents', 'hpvca' ]:
        ensure => installed,
      }
    }

    /7/: {
      package { [ 'hp-health' , 'hpsmh', 'hp-smh-templates', 'hp-snmp-agents', 'hpvca' ]:
        ensure => installed,
      }
    }

    default: { notice("operatingsystemrelease ${::operatingsystemrelease} is not supported") }

  }

}
