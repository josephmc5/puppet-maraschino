class maraschino::proxy inherits maraschino::params {
    if $proxy_nginx {
        include nginx
        nginx::resource::upstream { 'maraschino':
            ensure  => present,
            members => "$maraschino_host:$maraschino_port",
        }
        nginx::resource::location { 'maraschino':
            ensure   => present,
            proxy  => 'http://maraschino',
            location => "$maraschino_webroot",
            vhost    => "$external_dns",
        }
    }
}
