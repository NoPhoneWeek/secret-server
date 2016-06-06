# secret-server

After downloading, create a `whitelist` and a `blacklist` file. Each will contain (on separate lines) the IP addresses to be allowed/disallowed to access the secret. If a line starts with a `#` it will be ignored.

If you're on the whitelist, requesting `/change` will change the secret and return the new one, `/secret` will return the current secret and `/reload` will reload the whitelist and blacklist.

The port used by this is `9149`
