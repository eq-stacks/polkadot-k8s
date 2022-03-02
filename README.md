# Template repo
> Reusable, mass-producible code scaffolding for EQ Stacks

<!--
  Enter project specific info here, following the "standard readme" format
  https://github.com/RichardLitt/standard-readme/blob/master/spec.md

  Keep the info below so people know how to set up using the scripts
-->

## Installation

This IaaS code assumes that you have a [Shared VPC](https://cloud.google.com/vpc/docs/shared-vpc) set up
in your Google Cloud organization, as well as a project that specifically contains your service account(s).

You will need the IDs of both of those projects to start.

## Prerequisites and Setup

1. Install the Google Cloud SDK
2. `gcloud auth login`
3. Get the service account information from your administrator and add it to your gcloud config

Then run:

```bash
$ ./scripts/add_sa_role.sh
```

This will give the service account the necessary permissions for one hour while you do your IaaS work.