class oaeservice::redis ($is_slave = false) {

    # If the service is a slave instance, we configure the master IP in as the slaveof
    $master_host = hiera('cache_host_master')
    case $is_slave {
        false:      { $slave_of = $master_host }
        default:    { $slave_of = false }
    }

    class { '::redis': slave_of => $slave_of }
}