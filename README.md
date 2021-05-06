# jarvis

jarvis is a command line application to configure servers.

## Installation

jarvis currently supports Ubuntu 20.04. Install jarvis using the following command.

```
bash <(curl https://raw.githubusercontent.com/SamuelNitsche/jarvis/master/scripts/get.sh)
```

## Usage

### Adding sites

You can use the following command to create a new site.

```
jarvis site:add
```

You will be asked to enter a domain name. This domain name has to be entered __without__ the http protocol (eg. example.com).

By default jarvis will obtain a certificate using letsencrypt. You can disable it using the `--insecure` option.

```
jarvis site:add --insecure
```

### Deleting sites

Sites already added can be deleted using the following command.

```
jarvis site:delete
```

This command will present a table with all sites which were added by the user.