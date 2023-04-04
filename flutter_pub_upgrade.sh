which flutter
FVM=$?

if [ $FVM -eq 1 ];
then
  FLUTTER="fvm flutter pub upgrade"
else
  FLUTTER="flutter pub upgrade"
fi

clear

echo "Running pub upgrade in all packages"
echo ""
for dir in $(find . -type f -name "pubspec.yaml" | xargs dirname | sort | uniq)
do
  eval "$FLUTTER $dir"
  if [ $? -eq 0 ];
  then
    GREEN='\033[0;32m'
    NOCOLOR='\033[0m'

    echo "${GREEN}Successfully upgrade $dir $NOCOLOR"
  else
    RED='\033[0;31m'
    NOCOLOR='\033[0m'

    echo "${RED}Upgrade error in $dir $NOCOLOR"
  fi
done
echo ""
echo "Finished pub upgrade"
