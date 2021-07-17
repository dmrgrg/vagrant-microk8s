Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
    v.name = 'dive-microk8s'
    #v.gui = true
  end
  config.vm.disk :disk, name: "dive-microk8s", size: "50GB"
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.box = "generic/ubuntu2004"
  config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
  config.ssh.forward_agent = true
  config.vm.provision "file", source: "#{File.dirname(__FILE__)}/.bash_aliases", destination: "~/.bash_aliases"
  config.vm.provision :shell, path: "#{File.dirname(__FILE__)}/bin/bootstrap.sh"
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
end
