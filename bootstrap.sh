sudo pacman -Syu
sudo pacman -S docker
sudo systemctl enable docker --now

# installing Kubernetes
sudo pacman -S kubeadm kubelet kubectl kube-apiserver kube-controller-manager kubectl-cert_manager kubect-ingress_nginx kubectx kube-linter kubens kubeone kube-proxy kube-scheduler
swapoff -a
sudo pacman -Syu
sudo pacman -S docker
sudo systemctl enable docker --now
