# csi-node-driver-registrar

<https://github.com/kubernetes-csi/node-driver-registrar>

## git

```bash
git remote add upstream git@github.com:kubernetes-csi/node-driver-registrar.git
git fetch upstream
git merge v2.15.0
```

## build

```bash
docker run \
  -it \
  --rm \
  -v $PWD:/go/src/github.com/kubernetes-csi/node-driver-registrar \
  -w /go/src/github.com/kubernetes-csi/node-driver-registrar \
  -e BUILD_VERSION=v2.15.0 \
  registry.cn-qingdao.aliyuncs.com/wod/golang:1.24-alpine \
  bash .beagle/build.sh
```
