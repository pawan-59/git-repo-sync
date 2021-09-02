git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}

git config --global user.email "pawan@devtron.ai"
git config --global user.name "pawan_06d2"

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
