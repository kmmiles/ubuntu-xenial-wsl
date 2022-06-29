# ubuntu-xenial-wsl

## Install

Download the latest release zipfile, extract it and run `wsl-install.bat`.
Once Windows Terminal is restarted, you should see a new entry for the distribution.

## Modifying

Fork the repo, make any changes you want and push them. A test build will automatically kick off in the "Actions" tab.
When it looks good, click the "Releases" link on the right and "Draft a New Release". Create a new version tag (e.g. v1.0.1) and click "Publish Release".
If the build is succesful, the zifile will automatically be generated and attached to the release.

## Testing and building locally

You need `docker` or `podman` installed. 

To build: `./bin/build`
To create a release: `./bin/release`
To test the container: `./bin/shell`
