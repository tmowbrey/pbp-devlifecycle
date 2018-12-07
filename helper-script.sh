while getopts m:b:d:n: option
do
case "${option}"
in
m) MESSAGE=${OPTARG};;
b) BRANCH=${OPTARG};;
d) DEFAULTORG=${OPTARG};;
n) SCRATCHORGNAME=${OPTARG};;
esac
done
git add .
git commit -m "${MESSAGE}"
git push -u origin ${BRANCH}
sfdx force:org:create -v ${DEFAULTORG} -f config/project-scratch-def.json -a ${SCRATCHORGNAME} --wait 3
sfdx force:org:display -u ${SCRATCHORGNAME}
sfdx force:source:push -u ${SCRATCHORGNAME}
