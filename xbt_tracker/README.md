# xbt_tracker

xbt_tracker

## Usage

```bash
docker run --name xbt_tracker \
  -v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock \
  -p 0.0.0.0:2710:2710 \
  -d kauden/xbt_tracker
```
