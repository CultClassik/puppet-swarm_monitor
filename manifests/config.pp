# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include swarm_monitor::config
class swarm_monitor::config {

  docker::stack { $::swarm_monitor::stack_name :
    ensure        => present,
    stack_name    => $::swarm_monitor::stack_name,
    compose_files => [$::swarm_monitor::compose_file],
    require       => [
      File[$::swarm_monitor::compose_file],
      File[$::swarm_monitor::grafana_volume],
    ],
  }

}
