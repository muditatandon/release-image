FROM ubuntu
RUN apt update
RUN apt install -y git
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
RUN export PATH=$HOME/depot_tools:$PATH
RUN apt update
RUN apt upgrade -y
RUN apt install curl -y
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && apt update \
  && apt install gh -y
