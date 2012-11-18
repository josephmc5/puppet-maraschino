class maraschino::config {
    if $logrotate {
        logrotate::rule { 'maraschino':
            path          => "$log_dir/*",
            rotate        => 5,
            size          => '100k',
            sharedscripts => true,
            postrotate    => '/usr/bin/supervisorctl restart maraschino',
        }   
    }
    file { "$log_dir":
        ensure => directory,
        owner => 'maraschino',
        group => 'maraschino',
        mode => '0644',
    }
    package { 'sqlite3':
        ensure  => present,
    }
    file { "$base_dir/maraschino/data/":
        ensure => directory,
        owner => 'maraschino',
        group => 'maraschino',
    }
    file { "$base_dir/maraschino/config.sh":
        content => template('maraschino/config.sh.erb'),
        owner => 'maraschino',
        group => 'maraschino',
        mode => '0755',
        notify => Exec['sqlite3-config'],
    }
    file { 'sqlite3-check':
        content => template('maraschino/config_check.sh.erb'),
        path    => "$base_dir/maraschino/config_check.sh",
        owner => 'maraschino',
        group => 'maraschino',
        mode => '0755',
    }
    exec { 'sqlite3-config':
        command     => "$base_dir/maraschino/config.sh",
        unless      => "$base_dir/maraschino/config_check.sh",
        path        => '/usr/bin',
        require     => [Package['sqlite3'],File['sqlite3-check']],
    }
}
