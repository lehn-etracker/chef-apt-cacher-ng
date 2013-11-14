# Will install and enable Apt-Cacher-NG immediately
# if compiletime is set to true. Otherwise, it will be
# unavailable until the 2nd Chef run.

default['apt-cacher-ng']['compiletime'] = true

default['apt-cacher-ng']['ipaddress'] = '127.0.0.1'

default['apt-cacher-ng']['config']['cachedir'] =  '/var/cache/apt-cacher-ng'
default['apt-cacher-ng']['config']['logdir'] = '/var/log/apt-cacher-ng'
default['apt-cacher-ng']['config']['support_dir'] = nil
default['apt-cacher-ng']['config']['port'] =  3142
default['apt-cacher-ng']['config']['bindaddress'] = nil
default['apt-cacher-ng']['config']['proxy'] = nil
default['apt-cacher-ng']['config']['reportpage'] = 'acng-report.html'
default['apt-cacher-ng']['config']['socketpath'] = nil
default['apt-cacher-ng']['config']['unbufferlogs'] = false
default['apt-cacher-ng']['config']['verboselog'] = true
default['apt-cacher-ng']['config']['foreground'] = false
default['apt-cacher-ng']['config']['pidfile'] = nil
default['apt-cacher-ng']['config']['offlinemode'] = false
default['apt-cacher-ng']['config']['forcemanaged'] = false
default['apt-cacher-ng']['config']['extreshold'] = 4
default['apt-cacher-ng']['config']['exabortonProblems'] = true
default['apt-cacher-ng']['config']['stupidfs'] = false
default['apt-cacher-ng']['config']['forwardbtssoap'] = true
default['apt-cacher-ng']['config']['dnscacheseconds'] = 3600
default['apt-cacher-ng']['config']['debug'] = 3
default['apt-cacher-ng']['config']['exposeorigin'] = false
default['apt-cacher-ng']['config']['logsubmitedorigin'] = false
default['apt-cacher-ng']['config']['useragent'] = nil
default['apt-cacher-ng']['config']['recompbz2'] = nil
default['apt-cacher-ng']['config']['networktimeout'] = 60
default['apt-cacher-ng']['config']['dirperms'] = '00755'
default['apt-cacher-ng']['config']['fileperms'] = '00664'
default['apt-cacher-ng']['config']['freshindexmaxage'] = 27
default['apt-cacher-ng']['config']['allowuserports'] = nil
default['apt-cacher-ng']['config']['redirmax'] = 5
