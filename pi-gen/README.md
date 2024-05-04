# Patch creation using Quilt

Patch modifications to the `pi-gen` build process using `quilt`

## 1. Clone `pi-gen`

```bash
cd pi-gen
git clone --depth 1 git@github.com:RPi-Distro/pi-gen.git
cp config pi-gen/
```

## 1.1. Create a new patch

```bash
quilt new riverhouse-pi.diff
```

## 1.2. Adding files

You have to do this for all the files you're going to modify before you change them.

```bash
quilt add pi-gen/pi-gen/stage1/00-boot-files/files/config.txt
quilt add pi-gen/stage2/01-sys-tweaks/00-patches/07-resize-init.diff
quilt add pi-gen/stage0/02-firmware/01-packages
```

## 1.3. Now make changes to the source andupdate the patch with the changes

```bash
# After editing the files in the cloned pi-gen directory
quilt refresh # you can do this af often as you want

# Finish Editing
quilt pop -a
```

## 2. Applying patches

```bash
quilt push riverhouse-pi.diff
```

## 3. Editing an existing patch

To edit an existing patch, start by pushing it

```bash
quilt push riverhouse-pi.diff
```

Edit the files, when ready save it

```bash
quilt refresh riverhouse-pi.diff
```