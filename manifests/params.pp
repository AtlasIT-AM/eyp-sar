class sar::params {

  case $::osfamily
  {
    'redhat':
    {
      $packages=[ 'sysstat' ]
      $enablefile_debian=undef
      $sysstat_conf='/etc/sysconfig/sysstat'
      $sa_dir_default=undef
      $compress_after_default=undef
      $compress_default=undef
      case $::operatingsystemrelease
      {
        /^5.*$/:
        {
          $sadc_options_default=undef
        }
        /^6.*$/:
        {
          $sadc_options_default='-d'
        }
        /^7.*$/:
        {
          $sadc_options_default='-S DISK'
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      case $::operatingsystem
      {
        'Ubuntu':
        {
          $packages=[ 'sysstat' ]
          $enablefile_debian='/etc/default/sysstat'
          $sysstat_conf='/etc/sysstat/sysstat'
          $sadc_options_default='-S DISK'
          $compress_after_default='10'
          case $::operatingsystemrelease
          {
            /^1[46].*$/:
            {
              $sa_dir_default=undef
              $compress_default=undef
            }
            /^18.*$/:
            {
              $sa_dir_default='/var/log/sysstat'
              $compress_default='xz'
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    'Suse':
    {
      $sa_dir_default=undef
      $compress_default=undef
      $compress_after_default=undef
      case $::operatingsystem
      {
        'SLES':
        {
          case $::operatingsystemrelease
          {
            '11.3':
            {
              $packages=[ 'sysstat' ]
              $enablefile_debian=undef
              $sysstat_conf='/etc/sysstat/sysstat'
              $sadc_options_default=undef
            }
            default: { fail("Unsupported operating system ${::operatingsystem} ${::operatingsystemrelease}") }
          }
        }
        default: { fail("Unsupported operating system ${::operatingsystem}") }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
