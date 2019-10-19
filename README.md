# v-base64 0.1.0

Implementation of `base64` encoding for [V](https://vlang.io/).

> The version of this module will remain in `0.x.x` unless the language API's are finalized and implemented.

## Examples

```v
some_bytes := [byte(10), 20, 30, 40, 50]

encoded := base64.base64_encode(some_bytes)
decoded := base64.base64_decode(encoded) or {
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
