ip_addr=$(getent hosts kubernetes.default.svc.cluster.local | awk '{ print $1 }')
namespace="$(cat "/configuration/namespace.txt")"
region="$(cat "/configuration_region/region.txt")"

export DOCKER_HOST=tcp://localhost:2375
export KUBERNETES_SERVICE_PORT_HTTPS=443
export KUBERNETES_SERVICE_PORT=443
export KUBERNETES_PORT_443_TCP=tcp://${ip_addr}:443
export KUBERNETES_PORT_443_TCP_PROTO=tcp
export KUBERNETES_PORT_443_TCP_ADDR=${ip_addr}
export KUBERNETES_SERVICE_HOST=${ip_addr}
export KUBERNETES_PORT=tcp://${ip_addr}:443
export KUBERNETES_PORT_443_TCP_PORT=443
export POD_NAMESPACE=${namespace}

git clone "https://github.com/skabrits/Kubernetes-workshop.git" /config/workshop 2>/dev/null || true

cowsay "I love K8S ❤️"
echo "Your registry credentials for docker are:"
echo "user: $(cat /etc/prepare/reg_user.txt)"
echo "password: $(cat /etc/prepare/reg_pwd.txt)"
echo "image repository: $(cat /etc/prepare/reg_repo.txt)"