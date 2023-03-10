FROM ubuntu:latest
ENV token

RUN mkdir actions-runner && cd actions-runner
RUN curl -o actions-runner-linux-x64-2.302.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.302.1/actions-runner-linux-x64-2.302.1.tar.gz
RUN echo "3d357d4da3449a3b2c644dee1cc245436c09b6e5ece3e26a05bb3025010ea14d  actions-runner-linux-x64-2.302.1.tar.gz" | shasum -a 256 -c
RUN tar xzf ./actions-runner-linux-x64-2.302.1.tar.gz

CMD ./config.sh --url https://github.com/bastianrickmann/reddit_up_extension --token $token && ./run.sh