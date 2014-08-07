## API

### antispam(\<string>, \<delimiter>)

Parse the string searching the delimiter in a email string and replace it.

## Examples

when the delimitador is in a email string:

```
antispam('send email to kiko[at]ironhack.com', '[at]');
// => 'send email to kiko@ironhack.com'
```

when the delimiter is not in a email string:

```
antispam('send email to kiko[at]ironhack.com [at] eight o'clock', '[at]');
// => 'send email to kiko@ironhack.com [at] eight o'clock'
```

