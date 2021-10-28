swapoff -a
kubeadm init --ignore-preflight-errors=SystemVerification
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl proxy &
