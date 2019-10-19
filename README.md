# v-base64 0.1.0

Implementation of `base64` encoding for [V](https://vlang.io/).

The only difference from `base64` implementation in the V stdlib is that this library works
with byte sequences instead of strings.

> The version of this module will remain in `0.x.x` unless the language API's are finalized and implemented.

## Examples

```v
import popzxc.vbase64

some_bytes := [byte(10), 20, 30, 40, 50]

encoded := vbase64.base64_encode(some_bytes)
decoded := vbase64.base64_decode(encoded) or {
    panic("Incorrect string passed")
}

assert string(some_bytes) == string(decoded)
```

## Installaction

Via vpm:

```sh
v install popzxc.vbase64
```

Via vpkg:

```sh
vpkg get https://github.com/popzxc/vbase64
```

## Contributing

Feel free to open pull requests!

## License

[MIT](LICENSE)
