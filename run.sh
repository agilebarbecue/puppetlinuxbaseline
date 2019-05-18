#/bin/bash
puppet apply --modulepath=.. -e "include puppetlinuxbaseline::linuxbaseline"
echo "returned $?"
