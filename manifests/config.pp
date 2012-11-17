class maraschino::config {
    file { "$base_dir/maraschino/data/":
        ensure => directory,
        owner => 'maraschino',
        group => 'maraschino',
    }
#    file { "$base_dir/maraschino/config.ini":
#        content => template('maraschino/config.ini.erb'),
#        owner => 'maraschino',
#        group => 'maraschino',
#        mode => '0644',
#        require => File["$base_dir/maraschino/config/"],
#        notify => Service['supervisor::maraschino'],
#    }
    
    file { "$log_dir":
        ensure => directory,
        owner => 'maraschino',
        group => 'maraschino',
        mode => '0644',
    }
}
