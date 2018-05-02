class sar (
            $ensure         = 'installed',
            $enabled        = true,
            $history        = '30',
            $sadc_options   = $sar::params::sadc_options_default,
            $sa_dir         = $sar::params::sa_dir_default,
            $compress_after = $sar::params::compress_after_default,
            $compress       = $sar::params::compress_default,
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
    content => template("${module_name}/sysstat.erb"),
    require => Package[$sar::params::packages],
  }

}
