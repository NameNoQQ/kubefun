#!/usr/bin/env bash

if [[ $(id -u) != 0 ]]; then
  printf "\e[0;31m[!] You need to be root in order to run this script [!]\e[0;0m\n"
  exit;
fi

cat << EOF >> bootstrap.sh
sudo pacman -Syu
sudo pacman -S docker
sudo pacman -S  bash-completion
sudo systemctl enable docker --now

# installing Kubernetes
sudo pacman -S kubeadm kubelet kubectl kube-apiserver kube-controller-manager kubectl-cert-manager kubectl-ingress-nginx kubectx kube-linter kubens kubeone kube-proxy kube-scheduler
sudo pacman -S neovim tmux
swapoff -a
shutdown -r
EOF
echo "[✓] Created bootstrap.sh [✓]"

cat << EOF >> kubestrap.sh
swapoff -a
kubeadm init --ignore-preflight-errors=SystemVerification
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl proxy &
EOF
echo "[✓] Created kubestrap.sh [✓]"



cat << EOF > Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.provider "virtualbox" do |a| 
    a.memory = 2000
    a.cpus = 2
  end
  config.vm.provision "file" do |f|
    f.source      = "./bootstrap.sh"
    f.destination = "~/.bootstrap.sh"
  end
  config.vm.provision "file" do |f|
    f.source      = "./kubestrap.sh"
    f.destination = "~/.kubestrap.sh"
  end
end
EOF

vagrant up default
vagrant ssh default
