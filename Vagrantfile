Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
    v.name = 'vagrant-microk8s'
  end
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.box = "hashicorp/bionic64"
  config.vm.box_version = "1.0.282"
  config.vm.provision "file", source: "#{File.dirname(__FILE__)}/.bash_aliases", destination: "~/.bash_aliases"
  config.vm.provision :shell, path: "#{File.dirname(__FILE__)}/bin/bootstrap.sh"
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
end
