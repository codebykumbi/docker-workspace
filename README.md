# docker-workspace
convenient tool for setting up dockerised workspaces

## Usage

`./create-dw.sh <environment> <working_directory> <...docker options>?`

## Examples

### Migrating react environment to node.js environment
The react environment can be moved to the node environment by running the following in a plain node environment mounted to a pre-made react app (using react environment):

```
rm -rf node_modules
tar -xf node_modules.tar /tmp/node_modules
ls -s /tmp/node_modules node_modules
```

This uses the node_modules tar ball to create a new symlink that makes sense within the context of the node environment.

### Golang with host Docker unix socket mounted

Here is how to run a golang workspace at `./here` with the host Docker unix socket mounted

```
./create-dw.sh golang here -v /var/run/docker.sock:/var/run/docker.sock
```
