#!/bin/bash


repo_path="/home/tushar/Shell-scripting-for-devops"
log_file="/home/tushar/git_sync.log"
git_bin="/usr/bin/git"

cd "$repo_path" || { echo "Directory not found" >> "$log_file"; exit 1; }

if [[ -n "$($git_bin status --porcelain)" ]]
then
	echo "$(date): Changes detected . Starting Backup..." >> "$log_file"
	$git_bin add .
	$git_bin commit -m "Auto sync : $(date +'%Y-%m-%d %H:%M:%S')"
	$git_bin push origin main
	echo "$(date): Sync Done " >> "$log_file"
else
	 echo "$(date): No changes detected..." >> "$log_file"
fi

