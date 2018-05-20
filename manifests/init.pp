# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# required modules: nfs, docker, stdlib
#
# @example
#   include swarm_monitor
class swarm_monitor (
  String $stack_name,
  String $compose_file,
  String $traefik_hostname_influxdb,
  String $traefik_hostname_grafana,
  String $traefik_proxy_overlay,
  String $grafana_docker_image,
  String $grafana_volume,
  String $grafana_admin_user,
  String $grafana_admin_pass,
  String $influx_conf_file,
  String $influxdb_docker_image,
  String $influxdb_http_auth_enabled,
  String $influxdb_admin_user,
  String $influxdb_admin_password,
  String $influxdb_db,
  String $influxdb_user,
  String $influxdb_user_password,
  String $influxdb_read_user,
  String $influxdb_read_user_password,
  String $influxdb_write_user,
  String $influxdb_write_user_password,
  Hash $influxdb_share = {},
){

  contain ::swarm_monitor::install
  contain ::swarm_monitor::config

  Class[::swarm_monitor::install]
  -> Class[::swarm_monitor::config]

}
