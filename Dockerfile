FROM ubuntu
WORKDIR ~
ENV TOKEN=
ENV URL=
CMD ["bash"]
RUN apt update && apt upgrade -y
RUN apt install curl -y
RUN mkdir actions-runner && cd actions-runner
RUN curl -o actions-runner-linux-x64-2.302.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.302.1/actions-runner-linux-x64-2.302.1.tar.gz
RUN tar xzf ./actions-runner-linux-x64-2.302.1.tar.gz

ENTRYPOINT ["sh", " ~/actions-runner/config.sh --url $URL --token $TOKEN && ~/actions-runner/run.sh"]