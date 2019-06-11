# calibre-server
A docker image for calibre

```
	docker run -d \
		--name calibre-server \
		-p 8080:8080 \
		-e LIBDIRLIST='("/calibre-manga" "/manga-toadd" "/calibre-ebook" "/ebook-toadd")' \
		-v ~/manga-toadd:/manga-toadd \
		-v ~/ebook-toadd:/ebook-toadd \
		-v ~/calibre-manga:/calibre-manga \
		-v ~/calibre-ebook:/calibre-ebook \
		aizat125/calibre-server
```

Default Credentials:
User: bookkeeper
Pass: youshallnotpass

To get pid of calibre-server
```ss -ef ```

To kill calibre-server
```kill {CALIBRE-SERVER PID}```

To kill calibre-server
```kill {CALIBRE-SERVER PID}```

To manage users
```calibre-server --manage-users --userdb /srv/calibre/users.sqlite```
