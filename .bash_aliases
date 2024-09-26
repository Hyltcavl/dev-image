alias tf="terraform"
alias tfinit="terraform init -backend-config=backend.tfvars"
alias tfplan="terraform plan -var-file=backend.tfvars"
alias tfapply="terraform apply -var-file=backend.tfvars"
alias azlogin="az login --use-device-code"

alias tfformat="(cd ../../../ && terraform fmt --recursive)"

gitfast() {
  if [ $# -eq 0 ]; then
    echo "Please give a commit message: gitfast <commit_message>"
    return 1
  fi
  commit_message="$1"
  git add -A
  git commit -m "$commit_message"
  git push
  echo "Changes committed and pushed successfully!"
}