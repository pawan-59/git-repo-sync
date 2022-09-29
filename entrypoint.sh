git clone https://github.com/devtron-labs/devtron.git
cd devtron
git remote add target https://${INPUT_GITEE_TARGET_USERNAME}:${INPUT_GITEE_TARGET_TOKEN}@${INPUT_GITEE_TARGET_URL#https://}

git checkout main
git remote -v

echo "Helloooo"

sed -i "s/LTAG=.*/LTAG=\"main\";/" manifests/installation-script

sed -i "s/REPO_RAW_URL=.*/REPO_RAW_URL=\"https:\/\/gitee.com\/devtron-labs\/devtron\/raw\/\";/" manifests/installation-script

sed -i "s/url:.*/url: https:\/\/gitee.com\/devtron-labs\/devtron\/raw\/main\/manifests\/installation-script/" manifests/install/devtron-installer.yaml

sed -i "29 s/value:.*/value: https:\/\/gitee.com\/devtron-labs\/devtron.git/" manifests/yamls/migrator.yaml

sed -i "65 s/value:.*/value: https:\/\/gitee.com\/devtron-labs\/devtron.git/" manifests/yamls/migrator.yaml

sed -i "103 s/value:.*/value: https:\/\/gitee.com\/devtron-labs\/git-sensor.git/" manifests/yamls/migrator.yaml

sed -i "141 s/value:.*/value: https:\/\/gitee.com\/devtron-labs\/lens.git/" manifests/yamls/migrator.yaml

git config --global user.email ${INPUT_GITEE_TARGET_USEREMAIL}

git config --global user.name ${INPUT_GITEE_TARGET_USERNAME}


git add .
git commit -m "updated github link to gitee"

git push -f --all target
