# nginx-spdy

This is a patch to reapply SPDY support to nginx that was removed in
nginx 1.9.5.

SPDY support functions exactly the same as in 1.9.4, in particular see the
[listen directive](http://nginx.org/en/docs/http/ngx_http_core_module.html#listen)
and [ngx\_http\_spdy\_module](http://nginx.org/en/docs/http/ngx_http_spdy_module.html).

The SPDY sources are not included in this repository, instead [get-spdy.sh](get-spdy.sh)
will fetch nginx-1.9.4.tar.gz from nginx.org and extract the SPDY sources from there.

## Installation

```
wget http://nginx.org/download/nginx-1.9.12.tar.gz
tar -zxf nginx-1.9.12.tar.gz

patch -d nginx-1.9.12 -p1 -N < nginx-spdy-1.9.12.patch

./get-spdy.sh
mv spdy nginx-1.9.12/src/http/spdy

cd nginx-1.9.12
./configure --prefix=/opt/nginx-1.9.12 \
	--with-http_ssl_module \
	--with-http_spdy_module \
	--with-http_v2_module
make
```

## Compatibility

nginx-spdy has been tested to work with nginx 1.9.12-1.9.15.

No guarentees are offered with regards to correctness or safety.

## License

nginx-spdy is licensed under the same 2-clause BSD license as nginx.
See [LICENSE](LICENSE).
