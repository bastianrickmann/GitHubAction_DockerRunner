FROM ubuntu
ARG RUNNER_VERSION="2.302.1"
WORKDIR /home/docker
ENV TOKEN=
ENV URL=
RUN apt update && apt upgrade -y && useradd -m docker
RUN apt install curl -y
RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN chown -R docker /home/docker && /home/docker/actions-runner/bin/installdependencies.sh
USER docker

CMD  ~/actions-runner/config.sh --url $URL --token $TOKEN && ~/actions-runner/run.sh