git clone INPUT_SOURCE_REPO
git clone INPUT_TARGET_REPO
cd helm-chart
git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_REPO#https://}

git checkout main
git remote -v

cp -r $INPUT_SOURCE_DIR $INPUT_TARGET_DIR
git add .
git commit -m "Synching Repo"

git push target main
