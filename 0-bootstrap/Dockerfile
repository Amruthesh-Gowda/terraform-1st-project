
FROM gcr.io/cloud-builders/gcloud-slim

# Use ARG so that values can be overriden by user/cloudbuild
ARG TERRAFORM_VERSION=1.0.0

ENV ENV_TERRAFORM_VERSION=$TERRAFORM_VERSION

RUN apt-get update && \
    /builder/google-cloud-sdk/bin/gcloud -q components install alpha beta terraform-tools && \
    apt-get -y install curl jq unzip git ca-certificates gnupg && \
    curl https://releases.hashicorp.com/terraform/${ENV_TERRAFORM_VERSION}/terraform_${ENV_TERRAFORM_VERSION}_linux_amd64.zip --output terraform_${ENV_TERRAFORM_VERSION}_linux_amd64.zip && \
    curl https://releases.hashicorp.com/terraform/${ENV_TERRAFORM_VERSION}/terraform_${ENV_TERRAFORM_VERSION}_SHA256SUMS.sig --output terraform_SHA256SUMS.sig  && \
    curl https://releases.hashicorp.com/terraform/${ENV_TERRAFORM_VERSION}/terraform_${ENV_TERRAFORM_VERSION}_SHA256SUMS --output terraform_SHA256SUMS && \
    curl https://keybase.io/hashicorp/pgp_keys.asc --output pgp_keys.asc && \
    gpg --import pgp_keys.asc && \
    gpg --verify terraform_SHA256SUMS.sig terraform_SHA256SUMS && \
    grep terraform_${ENV_TERRAFORM_VERSION}_linux_amd64.zip terraform_SHA256SUMS | shasum --algorithm 256 --check  && \
    unzip terraform_${ENV_TERRAFORM_VERSION}_linux_amd64.zip -d /builder/terraform && \
    rm -f terraform_${ENV_TERRAFORM_VERSION}_linux_amd64.zip terraform_SHA256SUMS && \
    apt-get --purge -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH=/builder/terraform/:$PATH
ENTRYPOINT ["terraform"]
