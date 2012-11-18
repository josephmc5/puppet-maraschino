class maraschino::params (
    $maraschino_host = hiera("maraschino_host", "localhost"),
    $maraschino_port = hiera("maraschino_port", "8084"),
    $maraschino_webroot = hiera("maraschino_webroot", "/manage"),
    $sabnzbd_api_key = hiera("sabnzbd_nzb_key"),
    $base_dir = hiera("app_dir", "/opt"),
    $sabnzbd_host = hiera("sabnzbd_host", "localhost"),
    $sabnzbd_port = hiera("sabnzbd_port", "8080"),
    $sabnzbd_webroot = hiera("sabnzbd_webroot", "/sabnzbd"),
    $sabnzbd_api_key = hiera("sabnzbd_api_key"),
    $couchpotato_host = hiera("couchpotato_host", "localhost"),
    $couchpotato_port = hiera("couchpotato_port", "5000"),
    $couchpotato_webroot = hiera("couchpotato_webroot", "/movies"),
    $couchpotato_api_key = hiera("couchpotato_api_key"),
    $headphones_host = hiera("headphones_host", "localhost"),
    $headphones_port = hiera("headphones_port", "8083"),
    $headphones_webroot = hiera("headphones_webroot", "/music"),
    $headphones_api_key = hiera("headphones_api_key"),
    $sickbeard_host = hiera("sickbeard_host", '127.0.0.1'),
    $sickbeard_port = hiera("sickbeard_port", '8081'),
    $sickbeard_webroot = hiera("sickbeard_webroot", "/tv"),
    $sickbeard_api_key = hiera("sickbeard_api_key"),
    $external_dns = hiera("external_dns", "localhost"),
    $venv_dir = "venv",
    $url = hiera("maraschino_git_url", "git://github.com/mrkipling/maraschino.git"),
    $proxy_nginx = hiera("proxy_nginx", "false"),
    $proxy_apache = hiera("proxy_apache", "false"),
)
{
    $log_dir = "$base_dir/maraschino/log"
    $data_dir = "$base_dir/maraschino/data"
    $cache_dir = "$base_dir/maraschino/cache"
}
