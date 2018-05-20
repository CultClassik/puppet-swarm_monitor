# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include swarm_monitor::install
class swarm_monitor::install {

  file { $::swarm_monitor::grafana_volume:
    ensure => directory,
    owner  => '472',
    group  => '472',
    mode   => '0644',
  }

  file { $::swarm_monitor::compose_file:
    ensure  => file,
    content => epp(
      'swarm_monitor/swarm_monitor.yaml.epp',
      {
        'traefik_hostname_influxdb'    => $::swarm_monitor::traefik_hostname_influxdb,
        'traefik_hostname_grafana'     => $::swarm_monitor::traefik_hostname_grafana,
        'traefik_proxy_overlay'        => $::swarm_monitor::traefik_proxy_overlay,
        'grafana_docker_image'         => $::swarm_monitor::grafana_docker_image,
        'grafana_volume'               => $::swarm_monitor::grafana_volume,
        'grafana_admin_user'           => $::swarm_monitor::grafana_admin_user,
        'grafana_admin_pass'           => $::swarm_monitor::grafana_admin_pass,
        'influxdb_docker_image'        => $::swarm_monitor::influxdb_docker_image,
        'influxdb_http_auth_enabled'   => $::swarm_monitor::influxdb_http_auth_enabled,
        'influxdb_admin_user'          => $::swarm_monitor::influxdb_admin_user,
        'influxdb_admin_password'      => $::swarm_monitor::influxdb_admin_password,
        'influxdb_db'                  => $::swarm_monitor::influxdb_db,
        'influxdb_user'                => $::swarm_monitor::influxdb_user,
        'influxdb_user_password'       => $::swarm_monitor::influxdb_user_password,
        'influxdb_read_user'           => $::swarm_monitor::influxdb_read_user,
        'influxdb_read_user_password'  => $::swarm_monitor::influxdb_read_user_password,
        'influxdb_write_user'          => $::swarm_monitor::influxdb_write_user,
        'influxdb_write_user_password' => $::swarm_monitor::influxdb_write_user_password,
        'influxdb_volume'              => $::swarm_monitor::influxdb_share['path'],
      }
    ),
  }

  nfs::client::mount { $::swarm_monitor::influxdb_share['path']:
    server => $::swarm_monitor::influxdb_share['server'],
    share  => $::swarm_monitor::influxdb_share['share'],
  }

}
