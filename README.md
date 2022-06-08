# Container Builder for MSR 10.11 with Adapter Set 1

## Prerequisites

The Azure DevOps Project must have the following "secure files":

1. `sa.share.secrets.sh` - Connection credentials towards the input file share containing the binaries and the product and fix images files
2. `sp.credentials.sh` - Connection credentials to connect to the container registry where the images will be pushed
3. `msr-license.xml` - Valid MSR license

See `support` folder for examples.
