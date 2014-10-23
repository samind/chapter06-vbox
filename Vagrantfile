# -*- mode: ruby -*-
# vi: set ft=ruby :
Dotenv.load

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos6-virtualbox"
  config.vm.network :private_network, ip: "192.168.33.10"

    config.vm.provider :virtualbox do |v|
      v.name = config.vm.hostname
      v.customize ['modifyvm', :id, '--memory', '1024']
      v.customize ['modifyvm', :id, '--cpus',      '1']
      v.gui = true
    end
   
# if Vagrant.has_plugin?("vagrant-proxyconf")
#   config.proxy.http = "http://proxy2.nttcom.co.jp:8080/"
#   config.proxy.https = "http://proxy2.nttcom.co.jp:8080/"
#   config.proxy.no_proxy = "localhost,127.0.0.1,.192.168.1.140,.192.168.1.1"
# end

  
  config.vm.provision :shell, :path => "chef_inst.sh"
#  config.vm.provision :shell, :path => "repo_base.sh"
  config.vm.provision :shell, :path => "repo_epel.sh"
  config.vm.provision :shell, :path => "repo_remi.sh"
  config.vm.provision :shell, :path => "git_proxy.sh"
  
  #inline: 'sudo rpm -ihv http://192.168.1.140/vmshare/chef-11.16.2-1.el6.x86_64.rpm'
  #inline: 'curl -L https://www.opscode.com/chef/install.sh | sudo bash'

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.cookbooks_path = ["./cookbooks", "./site-cookbooks"]
    chef.json = {
      nginx: {
        env: ["php", "ruby"]
      }
    }
    chef.run_list = %w[
      recipe[nginx]
      recipe[php-env::php55]
      recipe[env-proxy] 
      recipe[ruby-env]
    ]
  end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision "chef_client" do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
