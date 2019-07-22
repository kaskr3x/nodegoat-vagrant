# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$msg = <<MSG
-------------------------------------------------------------------------------
Remember to run the commands in the next few lines, and have fun with NodeGoat!

Using your favourite editor, uncomment this line in config/env/development.js:
db: "mongodb://localhost:27017/nodegoat"

Change export PATH to wherever the mongodb-src-r4.0.10 folder is located at 
Default Location: /home/$USER/NodeGoat/mongodb-src-r4.0.10
Run: export PATH=/home/$USER/NodeGoat/mongodb-src-r4.0.10/bin:$PATH
E.g. if user is vagrant, then: export PATH=/home/vagrant/NodeGoat/mongodb-src-r4.0.10/bin:$PATH

To check if mongodb is running normally, run: cat /var/log/mongodb/mongod.log
Check for this line: [initandlisten] waiting for connections on port 27017

If you're deploying it to GCP:
nano config/env/all.js
and edit following parameters as such:
1. port: process.env.PORT || 80
2. hostName: x
with x being the external IP address of the VM

Site is accesible at 10.19.17.12:4000
-------------------------------------------------------------------------------
MSG

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.box_check_update = false
  # connect on port 13306
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.provision :shell, :path => "history.sh"
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]
  config.vm.network "private_network", ip: "10.19.17.12" 
  config.vm.post_up_message = $msg
end