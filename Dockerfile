FROM jenkins:1.609.3

USER root
RUN echo "deb http://apt.dockerproject.org/repo debian-jessie main" \
	> /etc/apt/sources.list.d/docker.list \
    && curl -fsSL https://yum.dockerproject.org/gpg | apt-key add - \
    && apt-get update \
    && apt-get install -y apt-transport-https sudo docker-engine \
    && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins