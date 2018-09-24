FROM ubuntu:16.04
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
      ca-certificates \
      openssh-server \
      curl \
      postfix

WORKDIR /
ENV GITLAB_OMNIBUS_CONFIG="gitlab_rails['gitlab_shell_ssh_port']=30022;"
RUN curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

RUN bash script.deb.sh

RUN apt-get update && EXTERNAL_URL="http://gitlab.example.com" apt-get install -yq gitlab-ce

# Missing Time Zone Data /usr/share/zoneinfo
# https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2229
RUN apt update && apt install -y tzdata && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22 80 443

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD [ "bash", "/entrypoint.sh" ]
