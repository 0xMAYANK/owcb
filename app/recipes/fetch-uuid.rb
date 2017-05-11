# Cookbook Name:: app
# Recipe:: fetch-uuid

bash 'get_proc_uuid' do
  user 'root'
  code <<-EOH
  cat /proc/sys/kernel/random/uuid > /root/uu1
  EOH
end