class maraschino::params (
    $maraschino_host = hiera("maraschino_host", "localhost"),
    $maraschino_port = hiera("maraschino_port", "8084"),
    $maraschino_webroot = hiera("maraschino_webroot", "/manage"),
    $sabnzbd_api_key = hiera("sabnzbd_nzb_key"),
    $base_dir = hiera("app_dir", "/opt"),
    $sabnzbd_host = hiera("sabnzbd_host", "localhost"),
    $sabnzbd_port = hiera("sabnzbd_port", "8080"),
    $sabnzbd_webroot = hiera("sabnzbd_webroot", "/sabnzbd"),
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
