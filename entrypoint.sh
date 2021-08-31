git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}

sed -ie "s/LTAG=.*/LTAG=\"main\";/" manifests/installation-script

sed -ie "s/REPO_RAW_URL=.*/REPO_RAW_URL= https:\/\/gitee.com\/pawan_06d2\/devtr\/raw\/main\/manifests\/installation-script/" manifests/installation-script

sed -ie "s/url:.*/url: https:\/\/gitee.com\/pawan_06d2\/devtr\/raw\/main\/manifests\/installation-script/" manifests/install/devtron-installer.yaml

sed -ie "29 s/value:.*/value: https:\/\/gitee.com\/pawan_06d2\/devtr.git/" manifests/yamls/migrator.yaml

sed -ie "65 s/value:.*/value: https:\/\/gitee.com\/pawan_06d2\/devtr.git/" manifests/yamls/migrator.yaml

sed -ie "103 s/value:.*/value: https:\/\/gitee.com\/pawan_06d2\/devtr.git/" manifests/yamls/migrator.yaml

sed -ie "141 s/value:.*/value: https:\/\/gitee.com\/pawan_06d2\/devtr.git/" manifests/yamls/migrator.yaml

git config --global user.email "pawan@devtron.ai"
git config --global user.name "pawan_06d2"
git add .
git commit -m "updated github link to gitee"
case "${GITHUB_EVENT_NAME}" in
    push)
        git push -f --all target
        git push -f --tags target
        ;;
    delete)
        git push -d target ${GITHUB_EVENT_REF}
        ;;
    *)
        break
        ;;
esac
