FROM nginx

WORKDIR /app

RUN apt update && apt install cron -y

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

COPY ./index.html.template /usr/share/nginx/html/index.html.template

COPY ./setup.sh /app/setup.sh
RUN chmod +x /app/setup.sh

COPY ./monitor.sh /bin/monitor.sh
RUN chmod +x /bin/monitor.sh

COPY ./monitor /etc/cron.d/monitor
RUN chown root /etc/cron.d/monitor

EXPOSE 80

CMD ["/bin/bash", "-c", "/app/setup.sh; cron; nginx -g \"daemon off;\""]