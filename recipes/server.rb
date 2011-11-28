#
# Cookbook Name::       cassandra
# Description::         Server
# Recipe::              server
# Author::              Benjamin Black (<b@b3k.us>)
#
# Copyright 2010, Flip Kromer
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

directory('/etc/sv/cassandra/env'){ owner 'root' ; action :create ; recursive true }
runit_service "cassandra" do
  options       node[:cassandra]
  run_state     node[:cassandra][:run_state]
end

include_recipe("cassandra::authentication")

template "#{node[:cassandra][:conf_dir]}/cassandra.yaml" do
  source        "cassandra.yaml.erb"
  owner         "root"
  group         "root"
  mode          "0644"
  variables     :cassandra => node[:cassandra]
  notifies      :restart, "service[cassandra]", :delayed if startable?(node[:cassandra])
end

template "#{node[:cassandra][:conf_dir]}/log4j-server.properties" do
  source        "log4j-server.properties.erb"
  owner         "root"
  group         "root"
  mode          "0644"
  variables     :cassandra => node[:cassandra]
  notifies      :restart, "service[cassandra]", :delayed if startable?(node[:cassandra])
end

# have some fraction of the nodes register as a seed with
# provides_service
if (node[:cassandra][:seed_node] || (node[:facet_index].to_i % 3 == 0) )
  provide_service(node[:cassandra][:cluster_name] + '-cassandra-seed')
end
provide_service(node[:cassandra][:cluster_name] + '-cassandra')
