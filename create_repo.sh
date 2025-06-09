#!/bin/bash
read -p "Enter the repo name : " repo_name
read -p $'Is public \n1.True \n2.False \n'  repo_vis_choice

repo_visibility="false" 
if [ $repo_vis_choice -eq 1 ]; then
	repo_visibility="true"
else
	repo_visibility="false"
fi

echo "repo_name is " $repo_name
echo "repo_visibility " $repo_visibility

if [[ -z "$personal_token" ]]; then
    read -sp "Enter your GitHub personal access token: " personal_token
    echo
fi

curl -v -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${personal_token}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/user/repos \
  -d '{"name":"'${repo_name}'","private":"'$repo_visibility'"}'
   
