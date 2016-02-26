# fluentd-plugin-docker-log-reformer

Fluentd plugin to format docker's container json log.

## Configuration

Example:

```
<match docker.**>
  type docker-log-reformer
  remove_keys container_id,source
  show_time false
</match>
```

Input:

```
2016-02-26 04:10:41 +0000 docker.dev-stg.nginx: {"source":"stdout","log":"192.168.99.1 - - [26/Feb/2016:04:10:41 +0000] \"GET / HTTP/1.1\" 200 22 \"-\" \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/601.4.4 (KHTML, like Gecko) Version/9.0.3 Safari/601.4.4\" \"-\" \"-\"","container_id":"8ce984be6014b6584eda7c111970a96f745427b53838722bffe53a5e6732780e","container_name":"/nginx"}
```

Output:

```
container_name:/nginx   log:192.168.99.1 - - [26/Feb/2016:04:02:51 +0000] "GET / HTTP/1.1" 200 22 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X
 10_10_5) AppleWebKit/601.4.4 (KHTML, like Gecko) Version/9.0.3 Safari/601.4.4" "-" "-"
```  

## Option Parameters

- remove_keys *string*

This options's key can remove keys at container's json log.

- show_time *bool*

This option can show now time at fluentd.

## Copyright

Copyright (c) 2015 Kohei Kawai. See LICENSE for details.


