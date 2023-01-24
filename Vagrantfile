manager_machines = {
  "master" => {"memory" => "1024", "cpu" => "1", "image" => "bento/ubuntu-22.04"}
#   "node02" => {"memory" => "1024", "cpu" => "1", "image" => "bento/ubuntu-22.04"},
#   "node03" => {"memory" => "1024", "cpu" => "1", "image" => "bento/ubuntu-22.04"},
#   "node04" => {"memory" => "1024", "cpu" => "1", "image" => "bento/ubuntu-22.04"}
}
worker_nodes = 1

Vagrant.configure("2") do |config|

  manager_machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.box_check_update = true
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "10.10.10.100"
      machine.vm.synced_folder ".", "/vagrant"
      machine.vm.provision "shell", path: "./setup/setup_master.sh", privileged: true   
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
      end
    end
  end
  (1..worker_nodes).to_a.each do |i|
    config.vm.define "worker0#{i}" do |worker|
      worker.vm.box = "bento/ubuntu-22.04"
      worker.vm.box_check_update = true
      worker.vm.boot_timeout = 300
      worker.vm.network :private_network, ip: "10.10.10.10#{i}"
      worker.vm.hostname = "worker0#{i}"
      worker.vm.synced_folder ".", "/vagrant"
      worker.vm.provision "shell", path: "./setup/setup_worker.sh", privileged: true
      worker.vm.provider "virtualbox" do |vb|
        vb.name = "worker0#{i}"
        vb.memory = "1024"
        vb.cpus = "1"
      end
    end
  end

end