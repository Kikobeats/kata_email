# antispam-js

[![Build Status](http://img.shields.io/travis/Kikobeats/antispam-js/master.svg?style=flat)](https://travis-ci.org/Kikobeats/antispam-js)
[![Dependency status](http://img.shields.io/david/Kikobeats/antispam-js.svg?style=flat)](https://david-dm.org/Kikobeats/antispam-js)
[![Dev Dependencies Status](http://img.shields.io/david/dev/Kikobeats/antispam-js.svg?style=flat)](https://david-dm.org/Kikobeats/antispam-js#info=devDependencies)
[![NPM Status](http://img.shields.io/npm/dm/antispam-js.svg?style=flat)](https://www.npmjs.org/package/antispam-js)
[![Gittip](http://img.shields.io/gittip/Kikobeats.svg?style=flat)](https://www.gittip.com/Kikobeats/)

> Very simple library for antispam

## Install

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

## License

MIT © [Kiko Beats](http://www.kikobeats.com)


