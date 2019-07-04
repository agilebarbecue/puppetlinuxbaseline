#/bin/bash
echo "deprecated - use scripts/docker config"
puppet apply --modulepath=.. -e "include puppetlinuxbaseline::linuxbaseline"
echo "returned $?"
