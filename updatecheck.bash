latest_tag=$(git ls-remote --tags https://github.com/ur-fault/TMaze | awk '{print $2}' | grep -oE "[0-9]+\.[0-9]+\.[0-9]+$" | sort -V | tail -n1)

saved_version=$(cat tmaze.txt)

if [ "$latest_tag" != "$saved_version" ]; then
    git config --global user.name "github-actions"
    git config --global user.email "you@example.com"
    echo "$latest_tag" > tmaze.txt
    sed -i 's/^iso_version="[^"]*"/iso_version="1.16.0"/' ./archlive/profiledef.sh
    echo "New version $latest_tag found"
    git add tmaze.txt
    git commit -m "new version of TMaze: $latest_tag"
    git push
    sleep 10
    gh workflow run build.yml
else
    echo "Nothing to do"
fi