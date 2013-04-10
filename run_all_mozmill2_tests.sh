echo "Removing old builds"
rm -r builds

echo "Downloading new builds"
mkdir builds

echo "Downloading Nightly"
mozdownload -t daily --branch=mozilla-central -d builds

echo "Downloading Aurora"
mozdownload -t daily --branch=mozilla-aurora -d builds

echo "Downloading Beta"
mozdownload -v latest-beta -d builds

echo "Downloading Release"
mozdownload -v latest -d builds

echo "Downloading ESR17"
mozdownload -v latest-esr -d builds

echo "Get all filenames"
REPORT=http://mozmill-crowd.blargon7.com/db/
FILES=builds/*
for f in $FILES
do
  echo "Running tests for $f ..."
  testrun_l10n --report=$REPORT $f
  testrun_addons --report=$REPORT $f --with-untrusted
  testrun_remote --report=$REPORT $f
  testrun_functional --report=$REPORT $f
  testrun_endurance --report=$REPORT $f --entities=10 --iterations=10
done
