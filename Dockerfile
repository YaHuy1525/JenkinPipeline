# Custom Jenkins Dockerfile with Node.js and npm pre-installed (Appendix I)
FROM jenkins/jenkins:lts

USER root

# Install dependencies, Node.js 18.x, and npm
RUN apt-get update && \
    apt-get install -y curl git build-essential && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Verify node and npm installations
RUN node -v && npm -v

USER jenkins
