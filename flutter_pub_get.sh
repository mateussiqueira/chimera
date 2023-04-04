which flutter
FVM=$?

if [ $FVM -eq 1 ];
then
  FLUTTER="fvm flutter pub get"
else
  FLUTTER="flutter pub get"
fi

clear

echo "Running pub get in all packages"
echo ""
for dir in $(find . -type f -name "pubspec.yaml" | xargs dirname | sort | uniq)
do
  echo "Running get packages in $dir"
  eval "$FLUTTER $dir"

  if [ $? -eq 0 ];
  then
    GREEN='\033[0;32m'
    NOCOLOR='\033[0m'

    echo "${GREEN}Success get packages in $dir $NOCOLOR"
  else
    RED='\033[0;31m'
    NOCOLOR='\033[0m'

    echo "${RED}Failed to get packages in $dir $NOCOLOR"
  fi
  echo ""
done
echo "Finished pub get"
