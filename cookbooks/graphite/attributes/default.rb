
default[:graphite][:conf_dir]              = '/etc/graphite'
default[:graphite][:data_dir]              = '/var/lib/graphite/storage'
default[:graphite][:log_dir]               = '/var/log/graphite'
default[:graphite][:pid_dir]               = '/var/run/graphite'

default[:graphite][:user]                  = 'www-data'
default[:graphite][:carbon   ][:user]      = 'www-data'
default[:graphite][:whisper  ][:user]      = 'www-data'
default[:graphite][:dashboard][:user]      = 'www-data'

default[:users ]['graphite'][:uid]         = 446
default[:groups]['graphite'][:gid]         = 446

default[:graphite][:carbon   ][:home_dir]  = '/usr/local/share/carbon'
default[:graphite][:whisper  ][:home_dir]  = '/usr/local/share/whisper'
default[:graphite][:dashboard][:home_dir]  = '/usr/local/share/graphite_dashboard'

default[:graphite][:carbon   ][:run_state] = :start
default[:graphite][:whisper  ][:run_state] = :start
default[:graphite][:dashboard][:run_state] = :start

default[:graphite][:carbon   ][:line_rcvr_addr]       = "0.0.0.0"
default[:graphite][:carbon   ][:pickle_rcvr_addr]     = "0.0.0.0"
default[:graphite][:carbon   ][:cache_query_addr]     = "0.0.0.0"

default[:graphite][:carbon   ][:version]              = "0.9.7"
default[:graphite][:carbon   ][:release_url]          = "http://launchpadlibrarian.net/61904798/carbon-0.9.7.tar.gz"
default[:graphite][:carbon   ][:release_url_checksum] = "ba698aca"

default[:graphite][:whisper  ][:version]              = "0.9.7"
default[:graphite][:whisper  ][:release_url]          = "http://launchpadlibrarian.net/61904764/whisper-0.9.7.tar.gz"
default[:graphite][:whisper  ][:release_url_checksum] = "c6272ad6"

default[:graphite][:dashboard][:version]              = "0.9.7c"
default[:graphite][:dashboard][:release_url]          = "http://launchpadlibrarian.net/62379635/graphite-web-0.9.7c.tar.gz"
default[:graphite][:dashboard][:release_url_checksum] = "a3e16265"
