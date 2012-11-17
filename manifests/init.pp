class maraschino inherits maraschino::params {
	include maraschino::config
    include maraschino::proxy
    include git
    include python::virtualenv
    include supervisor
	
	user { 'maraschino':
        allowdupe => false,
        ensure => 'present',
        shell => '/bin/bash',
        home => "$base_dir/maraschino",
        password => '*',
    }

    file { "$base_dir/maraschino":
        ensure => directory,
        owner => 'maraschino',
        group => 'maraschino',
        mode => '0644',
    }
    exec { 'venv-create-maraschino':
        command => "virtualenv $venv_dir",
        cwd => "$base_dir/maraschino",
        creates => "$base_dir/maraschino/$venv_dir/bin/activate",
        path => '/usr/bin/',
        require => Class['python::virtualenv'];
    }
    exec { 'download-maraschino':
        command => "/usr/bin/git clone $url src",
        cwd     => "$base_dir/maraschino",
        creates => "$base_dir/maraschino/src",
        require => Class['git'],
    }
    supervisor::service {
        'maraschino':
            ensure => present,
            enable => true,
            stdout_logfile => "$base_dir/maraschino/log/supervisor.log",
            stderr_logfile => "$base_dir/maraschino/log/supervisor.log",
            command => "$base_dir/maraschino/venv/bin/python $base_dir/maraschino/src/Maraschino.py --datadir $base_dir/maraschino/data --webroot $maraschino_webroot -p $maraschino_port --log $base_dir/maraschino/log/maraschino.log",
            user => 'maraschino',
            group => 'maraschino',
            directory => "$base_dir/maraschino/src/",
            require => Exec['download-maraschino'],
    }
}
