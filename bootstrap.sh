sudo pacman -Syu
sudo pacman -S docker
sudo systemctl enable docker --now

# installing Kubernetes
sudo pacman -S kubeadm kubelet kubectl kube-apiserver kube-controller-manager kubectl-cert-manager kubectl-ingress-nginx kubectx kube-linter kubens kubeone kube-proxy kube-scheduler
