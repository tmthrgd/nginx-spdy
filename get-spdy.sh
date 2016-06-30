if [ ! -f nginx-1.9.4.tar.gz ]; then
	wget "http://nginx.org/download/nginx-1.9.4.tar.gz" || exit 1
fi

sha512sum -c --quiet <(echo "6616b971361ded7a316a5718dffb2476dac0c625afb047595fbca0e24ea84391d3e0df88bc8d6a40747411094f8453a85c331d8089e51eecd1ac152898bb350a  nginx-1.9.4.tar.gz") \
	|| { rm -f nginx-1.9.4.tar.gz; exit 1; }

rm -r spdy 2>/dev/null
mkdir spdy || exit 1

tar --wildcards --strip-components=3 -C spdy -zxf nginx-1.9.4.tar.gz nginx-1.9.4/src/http/ngx_http_spdy*
