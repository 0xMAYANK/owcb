# Memcache attributes

default[:memcached][:memory] = 2048
default[:memcached][:port] = 11211
default[:memcached][:user] = "nobody"
default[:memcached][:max_connections] = "20000"

case node[:platform]
when 'redhat', 'centos', 'fedora', 'amazon'
  default[:memcached][:pid_file] = '/var/run/memcached/memcached.pid'
when 'debian', 'ubuntu'
  default[:memcached][:pid_file] = '/var/run/memcached.pid'
else
  raise 'Bailing out, unknown platform.'
end

default[:memcached][:start_command] = "/etc/init.d/memcached start"
default[:memcached][:stop_command] = "/etc/init.d/memcached stop"
