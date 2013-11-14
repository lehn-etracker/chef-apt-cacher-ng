service "apt-cacher-ng"

acng_service = package 'apt-cacher-ng' do
  action(node['apt-cacher-ng']['compiletime'] ? :nothing : :install)
  notifies :start, "service[apt-cacher-ng]", :immediately
end
acng_service.run_action(:install) if node['apt-cacher-ng']['compiletime']

d = directory node['apt-cacher-ng']['config']['cachedir'] do
  action(node['apt-cacher-ng']['compiletime'] ? :nothing : :create)
  owner "apt-cacher-ng"
  group "apt-cacher-ng"
  mode 0755
end
d.run_action(:create) if node['apt-cacher-ng']['compiletime']

t = template "/etc/apt-cacher-ng/acng.conf" do
  action(node['apt-cacher-ng']['compiletime'] ? :nothing : :create)
  source "acng.conf.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :restart, "service[apt-cacher-ng]", :immediately
end
t.run_action(:create) if node['apt-cacher-ng']['compiletime']


include_recipe "apt-cacher-ng::client"
