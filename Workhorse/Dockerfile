From lscr.io/linuxserver/openssh-server

RUN apk update
RUN apk add vim
RUN apk add openssl
RUN apk add git
RUN apk add --update docker openrc
RUN sudo apk add aws-cli
RUN rc-update add docker boot

RUN apk add cowsay --update-cache --repository https://alpine.global.ssl.fastly.net/alpine/edge/community --repository https://alpine.global.ssl.fastly.net/alpine/edge/main --repository https://dl-3.alpinelinux.org/alpine/edge/testing

RUN sed "s/$(grep "PermitUserEnvironment" /etc/ssh/sshd_config)/PermitUserEnvironment yes/g" /etc/ssh/sshd_config

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

COPY setup.sh /etc/profile.d/setup_kube.sh
RUN chmod +x /etc/profile.d/setup_kube.sh

RUN mkdir -p /configuration
RUN mkdir -p /configuration_region
RUN echo "default" > /configuration/namespace.txt
RUN echo "Siberia" > /configuration_region/region.txt

RUN mkdir -p /etc/prepare
RUN echo "admin" > /etc/prepare/reg_user.txt
RUN echo "admin" > /etc/prepare/reg_pwd.txt
RUN echo "example.com" > /etc/prepare/reg_repo.txt

ENV SSH_PORT=2223

EXPOSE $SSH_PORT