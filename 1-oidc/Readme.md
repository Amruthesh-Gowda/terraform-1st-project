# How to use OIDC Terrafrom Block and integrate with Github

## Setting up Github Repo work with Google's Workload Identitiy Federation have three steps 

1. Update "sa_mapping" in main.tf
2. Edit the Github Action Workflow file, and set the below arguments, this ensures job can read the Github Token, 

```
    permissions:
      contents: 'read'
      id-token: 'write'

```
3. Add the below step within the job which ensures token exchange b/w Github and Google, 

```
      - id: 'auth'
        name: 'Authenticate to Google Cloud'
        uses: 'google-github-actions/auth@v0'
        with:
          token_format: 'access_token'
          workload_identity_provider: "projects/843125233393/locations/global/workloadIdentityPools/mt-gh-wif-pool-01/providers/mt-gh-provider-01" // workload-identity-provider-self-link
          service_account: ${{ secrets.TF_SA}} // Service-account-name
```



## Example, 

```
name: TF

on:
  push:
    branches:
      - 'feature/**'
      - main
  pull_request:
  workflow_dispatch:

env:
  TF_LOG: WARN

jobs:
  test_job_name:
    runs-on: ubuntu-latest
    permissions:
      contents: 'read'
      id-token: 'write'
    env: 
      ORG_ROOT: "hopper"
      TERRAFOROM_VERSION: '1.2.6'

    steps:
      - uses: actions/checkout@v3

      - id: 'auth'
        name: 'Authenticate to Google Cloud'
        uses: 'google-github-actions/auth@v0'
        with:
          token_format: 'access_token'
          workload_identity_provider: "projects/843125233393/locations/global/workloadIdentityPools/mt-gh-wif-pool-01/providers/mt-gh-provider-01"
          service_account: ${{ secrets.TF_SA}}
```