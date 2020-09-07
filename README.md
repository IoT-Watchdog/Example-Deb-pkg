# Example-Deb-pkg
Example repository for building Raspbian .deb packages

based on https://blog.packagecloud.io/debian/debuild/packaging/2015/06/08/buildling-deb-packages-with-debuild/

pbuilderrc must bei copied to /root/:
```
root@host % cp pbuilderrc /root/.pbuilderrc
```

### Needed tools:

```
aptitude install devscripts build-essential lintian pbuilder qemu-user-static qemu-system-arm debhelper
```

### Create init cfg:

```
export DEBFULLNAME="Max Muster"
export DEBEMAIL="max.muster@mailbox.org"
dch --create --newversion 0.0.1 --package hellodebian
```

### Generate src pkg

as root:
```
debuild -i -us -uc -S
```

### Generate deb pkg

for every target arch:
```
OS=raspbian DIST=buster ARCH=armhf pbuilder --create
OS=debian DIST=buster ARCH=amd64 pbuilder --create
```

