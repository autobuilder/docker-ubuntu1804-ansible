FROM ubuntu:18.04
LABEL maintainer="AutoBuilder24x7"

ENV pip_packages "ansible"

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       locales \
       python-setuptools \
       python-pip \
       software-properties-common \
       rsyslog systemd systemd-cron sudo iproute2 \
    && apt-get clean

# Install Ansible via Pip.
RUN pip install $pip_packages

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

CMD ["/lib/systemd/systemd"]
