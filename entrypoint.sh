#git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}

git clone https://github.com/pawan-59/devtron.git
git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@gitee.com/pawan_06d2/devtr.git
cd devtron
git checkout main
git remote -v

sed -i "s/LTAG=.*/LTAG=\"main\";/" manifests/installation-script

sed -i "s/REPO_RAW_URL=.*/REPO_RAW_URL= https:\/\/gitee.com\/devtron-labs\/devtron\/raw/" manifests/installation-script

sed -i "s/url:.*/url: https:\/\/gitee.com\/devtron-labs\/devtron\/raw\/main\/manifests\/installation-script/" manifests/install/devtron-installer.yaml

sed -i "29 s/value:.*/value: https:\/\/gitee.com\/devtron-labs\/devtron.git/" manifests/yamls/migrator.yaml

sed -i "65 s/value:.*/value: https:\/\/gitee.com\/devtron-labs\/devtron.git/" manifests/yamls/migrator.yaml

sed -i "103 s/value:.*/value: https:\/\/gitee.com\/devtron-labs\/git-sensor.git/" manifests/yamls/migrator.yaml

sed -i "141 s/value:.*/value: https:\/\/gitee.com\/devtron-labs\/lens.git/" manifests/yamls/migrator.yaml

git config --global user.email "pawan@devtron.ai"
git config --global user.name "pawan_06d2"

git add .
git commit -m "updated github link to gitee"

git push -f --all target

#case "${GITHUB_EVENT_NAME}" in
#    release)
#        git push -f target main
#        ;;
#    push)
#        git push -f --all target
#        git push -f --tags target
#        ;;
 #   delete)
 #       git push -d target ${GITHUB_EVENT_REF}
 #       ;;
 #   *)
 #       break
 #       ;;
#esac
