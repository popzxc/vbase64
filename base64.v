// Copyright (c) 2019 Igor Aleksanov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.

module base64

const (
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    max_idx = alphabet.len - 1
    m1 = max_idx << 18
    m2 = max_idx << 12
    m3 = max_idx << 6
)

// Encodes a provided bytes sequence to the base64 string.
pub fn base64_encode(input []byte) string {
    mut result := ""
    mut current := 0
    mut left := input.len
    mut d := 0

    for (left > 2) {
        d = int(input[current] << 16) | int(input[current + 1] << 8) | int(input[current + 2])
        result += alphabet[( d & m1 ) >> 18 ].str()
        result += alphabet[( d & m2 ) >> 12 ].str()
        result += alphabet[( d & m3 ) >>  6 ].str()
        result += alphabet[d & max_idx ].str()
        current += 3
        left -= 3
    }

    if (left == 2) {
        d = int(input[current] << 16) | int(input[current + 1] << 8)
        result += alphabet[( d & m1 ) >> 18].str()
        result += alphabet[( d & m2 ) >> 12].str()
        result += alphabet[( d & m3 ) >>  6].str()
        result += '='
    } else if (left == 1) {
        d = int(input[current] << 16)
        result += alphabet[( d & m1 ) >> 18].str()
        result += alphabet[( d & m2 ) >> 12].str()
        result += "=="
    }
    return result
}

fn find_index(val byte) ?int {
    if (`A` <= val && val <= `Z`) {
        return int(val - `A`)
    }
    if (`a` <= val && val <= `z`) {
        return int(val - `a` + 26)
    }
    if (`0` <= val && val <= `9`) {
        return int(val - `0` + 52)
    }
    if (val == `+`) {
        return 62
    }
    if (val == `/`) {
        return 63
    }
    return error("Incorrect byte $val")
}

// Decodes a provided base64 string to the bytes sequence.
pub fn base64_decode(input string) ?[]byte {
    mut current := 0
    mut acc := 0
    mut output := []byte

    if (input.len % 4 != 0) {
        return error("Input string is not aligned")
    }

    for (current != input.len) {
        b1 := input[current]
        b2 := input[current + 1]
        b3 := input[current + 2]
        b4 := input[current + 3]
        current += 4

        i1 := find_index(b1) or {
            return error(err)
        }
        i2 := find_index(b2) or {
            return error(err)
        }

        acc = i1 << 2
        acc |= i2 >> 4

        output << byte(acc)

        if b3 == `=` {
            break
        }

        i3 := find_index(b3) or {
            return error(err)
        }

        acc = (i2 & 0xF) << 4
        acc |= i3 >> 2

        output << byte(acc)

        if b4 == `=` {
            break
        }

        i4 := find_index(b4) or {
            return error(err)
        }

        acc = (i3 & 0x3) << 6
        acc |= i4

        output << byte(acc)
    }

    return output
}