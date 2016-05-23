
_osfamily               = fact('osfamily')
_operatingsystem        = fact('operatingsystem')
_operatingsystemrelease = fact('operatingsystemrelease').to_f

case _osfamily
when 'RedHat'
  $sysstatconf = '/etc/sysconfig/sysstat'

when 'Debian'
  $sysstatconf = '/etc/sysstat/sysstat'

else
  $whaterver = '-_-'

end
