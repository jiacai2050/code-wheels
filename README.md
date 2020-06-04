dotfiles
===========

> Good tools are prerequisite to the successful execution of a job.
> 工欲善其事，必先利其器。

### submodule 更新方式

- https://stackoverflow.com/a/914090/2163429

```
# 修改 .gitmodules 后
git submodule sync

# 更新到最新 commit
git submodule update --init --recursive --remote

# 更新到指定 commit
git submodule update --init
```

### magit

通过源码编译 magit 时可能遇到

```
magit.texi:6: warning: unrecognized encoding name `UTF-8'.

# 解决方式
PATH=/usr/local/opt/texinfo/bin:$PATH make
```
参考：https://github.com/jwiegley/use-package/issues/609
