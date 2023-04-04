which flutter
FVM=$?

if [ $FVM -eq 1 ];
then
  FLUTTER="fvm flutter clean"
else
  FLUTTER="flutter clean"
fi

clear

echo "Running clean in all packages"
echo ""

for dir in $(find . -type f -name "pubspec.yaml" | xargs dirname | sort | uniq)
do
  cd $dir
    echo "Cleaning $dir"
  
  eval $FLUTTER
  if [ $? -eq 0 ];
  then
    GREEN='\033[0;32m'
    NOCOLOR='\033[0m'

    echo "${GREEN}Successfully cleaned $dir $NOCOLOR"
    echo ""
  else
    RED='\033[0;31m'
    NOCOLOR='\033[0m'

    echo "${RED}Error in cleaning $dir $NOCOLOR"
    echo ""
  fi
  cd - 
done
echo  ""
printf "Finished clean."


