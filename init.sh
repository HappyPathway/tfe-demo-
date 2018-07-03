#!/bin/bash
WS=${1}

terraform apply -auto-approve -var repo=tfe-demo-${WS}
tfe workspace new -tfe-workspace tfe-demo-${WS} -vcs-id ${TF_VAR_github_organization}/tfe-demo-${WS}

tfe pushvars -tfe-workspace tfe-demo-${WS} \
-senv-var "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
-senv-var "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
-var ec2_instance_instance_name=darnold-aws-demo \
-env-var "CONFIRM_DESTROY=1" \
-env-var AWS_DEFAULT_REGION=us-east-1

rm LICENSE README.md || echo 
git init
git remote add origin git@github.com:${TF_VAR_github_organization}/tfe-demo-${WS}
mv .gitignore .gitignore.tmp
git pull origin master
mv .gitignore.tmp .gitignore
git add .
git commit -m 'initial add'
git push -u origin master


terraform output
