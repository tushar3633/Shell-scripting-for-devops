#!/bin/bash


TARGET_DIR=$1
BRANCH=${2:-main}
log_file="$HOME/git_sync_universal.log"
git_bin=$(which git)

check_internet() {
	if ping -q -c 1 -w 1 8.8.8.8 >dev/null 2>&1; then
		return 0
	else
		return 1
	fi
		
}

#directory check
if [ -z "$TARGET_DIR" ] || [ ! -d "$TARGET_DIR"]; then
	echo "$(date): Error - Valid Directory path required">>"$log_file"
	exit 1
fi

#internet check
if ! check_internet ; then
	echo "$(date): Network error - Sync Skipped for $TARGET_DIR, auto retry on next session">>"$log_file"
	exit 1
fi

cd "$TARGET_DIR" || exit 1


if [[ -n "$($git_bin status --porcelain)" ]]
then
	echo "$(date): Changes detected . Syncing $TARGET_DIR..." >> "$log_file"
	$git_bin add .
	$git_bin commit -m "Auto sync : $(date +'%Y-%m-%d %H:%M:%S')"
	
	if $git_bin push origin "$BRANCH" ;then
		echo "$(date): Sync Done " >> "$log_file"
		exit 0
	else
		echo "$(date):Push Failed (Possible authentication or remote issue)" >> "$log_file"
		exit 1
	fi

else
	 echo "$(date): No changes detected in $TARGET_DIR. Timestamp updated" >> "$log_file"
	 exit 0
fi

