git clone $INPUT_SOURCE_REPO
echo $INPUT_SOURCE_REPO
git clone $INPUT_TARGET_REPO
echo $INPUT_SOURCE_REPO
cd $INPUT_WORKING_DIR
echo $INPUT_SOURCE_REPO
echo $INPUT_GIT_TARGET_USERNAME
git remote add target https://${INPUT_GIT_TARGET_USERNAME}:${INPUT_GIT_TARGET_TOKEN}@${INPUT_TARGET_REPO#https://}

git checkout main
git remote -v

git config --global user.email ${INPUT_GIT_TARGET_USEREMAIL}
echo $INPUT_GIT_TARGET_USEREMAIL
git config --global user.name ${INPUT_GIT_TARGET_USERNAME}

cp -r ../${INPUT_SOURCE_DIR} $INPUT_TARGET_DIR
echo $INPUT_SOURCE_DIR
echo $INPUT_TARGET_DIR
git add .
git commit -m "Synching Repo"

git push target main
