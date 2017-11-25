# RethinkDB Backup Container

This simple image bundles the needed python driver for backing up a rethinkdb.

## Usage

Suppose you have a running RethinkDB in another container with name `mydb`. You
can use this container to create a backup in the current working directory:
```
docker run -it --rm -u `id -u`:`id -g` -v $PWD:/work --net container:mydb ulrichschreiner/rethink-backup
```

If your database is running on a specific host or another port (as the default)
simply use the correct command as the command for this image, for example
```
docker run -it --rm -u `id -u`:`id -g` -v $PWD:/work ulrichschreiner/rethink-backup rethink dump -c myDBserver:12345
```

The backup file is written to `/work` so this should be a mount. If you speicify
the `-f` parameter to write the backup to another location, be sure to mount your
destination directory!

To restore data you must overwrite the default `CMD` with `rethink restore ...`.

## RClone

`rclone`  is added to this image for better access to 3rd level storage. You should mount your 
config when running with something like
```
docker run ... -v /my/path/to/rclone.backup.conf:/root/.config/rclone/rclone.conf ulrichschreiner/rethink-backup ..."
```

