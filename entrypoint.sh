git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}
echo "manifests"
ls manifests
echo "/manifests/install"
ls manifests/install

sed -i "s/LTAG=.*/LTAG=\"main\";/" manifests/installation-script

sed -i "s/REPO_RAW_URL=.*/REPO_RAW_URL= https:\/\/gitee.com\/pawan_06d2\/devtr\/raw\/main\/manifests\/installation-script/" manifests/installation-script

sed -i "s/url:.*/url: https:\/\/gitee.com\/pawan_06d2\/devtr\/raw\/main\/manifests\/installation-script/" manifests/install/devtron-installer.yaml

sed -i "29 s/value:.*/value: https:\/\/gitee.com\/pawan_06d2\/devtr.git/" manifests/yamls/migrator.yaml

sed -i "65 s/value:.*/value: https:\/\/gitee.com\/pawan_06d2\/devtr.git/" manifests/yamls/migrator.yaml

sed -i "103 s/value:.*/value: https:\/\/gitee.com\/pawan_06d2\/devtr.git/" manifests/yamls/migrator.yaml

sed -i "141 s/value:.*/value: https:\/\/gitee.com\/pawan_06d2\/devtr.git/" manifests/yamls/migrator.yaml

git config --global user.email "pawan@devtron.ai"
git config --global user.name "pawan_06d2"

git commit -am "updated github link to gitee 1"
echo "manifests"
ls manifests
echo "/manifests/install"
ls manifests/install
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
echo "manifests"
ls manifests
echo "/manifests/install"
ls manifests/install
