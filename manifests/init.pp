class sar (
            $ensure  = 'installed',
            $enabled = true,
            $history = '30',
          ) inherits sar::params{

  package { $sar::params::packages:
    ensure => $ensure,
  }

  if ($sar::params::enablefile_debian)
  {
    file { $sar::params::enablefile_debian:
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => inline_template("ENABLED=\"<% if @enabled %>true<% else %>false<% end %>\"\n"),
      require => Package[$sar::params::packages],
    }
  }

  file { $sar::params::sysstat_conf:
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($sar::params::sysstat_template),
    require => Package[$sar::params::packages],
  }

}
