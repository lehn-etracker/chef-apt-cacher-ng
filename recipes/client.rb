proxy_template = template '/etc/apt/apt.conf.d/01proxy' do
  source '01proxy.erb'
  owner 'root'
  group 'root'
  mode 00644
  variables(
    :proxy => node['apt-cacher-ng']['ipaddress'],
    :port => node['apt-cacher-ng']['config']['port']
    )
  action( node['apt-cacher-ng']['compiletime'] ? :nothing : :create )
end
proxy_template.run_action(:create) if node['apt-cacher-ng']['compiletime']


