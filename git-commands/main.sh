# Import the constants
source /Users/pedroduarte/dev/scripts/constants.sh

echo "${INFO}Executing git checkout main${RESET}"
  git checkout main
echo "\n${INFO}Executing git pull origin main${RESET}"
  git pull origin main
echo "\n${INFO}Cleaning up deleted remote branches${RESET}"
git remote prune origin
# Clean up local branches that no longer have a remote
echo "\n${INFO}Cleaning up local branches that no longer exist on remote${RESET}"
git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -D
