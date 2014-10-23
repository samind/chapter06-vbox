#
# Cookbook Name:: env-proxy
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

proxy = node['env-proxy']['proxy']
 
bash "proxy on profile" do
  not_if { proxy.empty? }
  code <<-EOC
    echo "export http_proxy=#{proxy}" >> /etc/profile
    echo "export https_proxy=#{proxy}" >> /etc/profile
    source /etc/profile
  EOC
end
