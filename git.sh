sleep 2s
echo "#--------------------starting git--------------------#"
sleep 2s
git config --global user.email "lpdmonteiro@gmail.com"
git config --global user.name "Leonam Monteiro"
git config --global --add safe.directory E:/git/scripts
echo "#--------------------adding modified files to git--------------------#"
git add --all
sleep 2s
echo "#--------------------modified files are as follows--------------------#"
git status
sleep 2s
echo "#--------------------give your git message--------------------#"
sleep 2s
read -p 'add a commit message: ' message
git commit -m "$message"
sleep 2s
echo "#--------------------pushing--------------------#"
# git push git@gitlab.com/lpdm1/front-end.git
git push
