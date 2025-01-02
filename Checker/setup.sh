[ -f "/app/names.txt" ] || kubectl get ns | awk '{print $1}' | sed -e "/kube-/d" -e "/NAME/d" -e "/local-path/d" -e "/default/d" -e "/ingress/d" > /app/names.txt

[ -f "/app/endpoint.txt" ] || kubectl get svc -n ingress-nginx ingress-nginx-controller -o jsonpath="{.status.loadBalancer.ingress[0].hostname}" > /app/endpoint.txt