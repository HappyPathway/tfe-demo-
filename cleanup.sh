#!/bin/bash
WS=${1}

tfe workspace delete -tfe-workspace tfe-demo-${WS}
rm -rf .git/
rm main.tf
terraform destroy -auto-approve -var repo=tfe-demo-${WS}
