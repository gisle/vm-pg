# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.forward_port 80, 8080
  config.vm.forward_port 5432, 5432
  config.vm.provision :puppet
end
