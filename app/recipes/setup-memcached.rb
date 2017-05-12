package "memcached" do
  action :upgrade
  retries 3
  retry_delay 5
end

#
# be aware that Amazon Linux uses a different configuration schema.
case node[:platform]
when 'centos','redhat','fedora','amazon'
  template '/etc/sysconfig/memcached' do
    source 'memcached.sysconfig.erb'
    owner 'root'
    group 'root'
    mode 0644
    variables(
      :user => node[:memcached][:user],
      :port => node[:memcached][:port],
      :memory => node[:memcached][:memory]
      :maxconn => node[:memcached][:max_connections]
    )
    notifies :restart, "service[memcached]", :immediately
  end
end
