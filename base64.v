// Copyright (c) 2019 Igor Aleksanov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.

module base64

const (
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    m1 = 63 << 18
    m2 = 63 << 12
    m3 = 63 << 6
)

pub fn base64(v []byte) string {
    mut result := ""
    mut d := 0
    mut a := 0
    mut l := v.len

    for (l > 2) {
	    d = int(v[a] << 16) | int(v[a + 1] << 8) | int(v[a + 2])
	    result += alphabet[( d & m1 ) >> 18 ].str()
	    result += alphabet[( d & m2 ) >> 12 ].str()
	    result += alphabet[( d & m3 ) >>  6 ].str()
	    result += alphabet[d & 63 ].str()
        a += 3
	    l -= 3
	}

	if (l == 2) {
	    d = int(v[a] << 16) | int(v[a + 1] << 8)
	    result += alphabet[( d & m1 ) >> 18].str()
	    result += alphabet[( d & m2 ) >> 12].str()
	    result += alphabet[( d & m3 ) >>  6].str()
	    result += '='
	} else if (l == 1) {
	    d = int(v[a] << 16)
	    result += alphabet[( d & m1 ) >> 18].str()
	    result += alphabet[( d & m2 ) >> 12].str()
	    result += "=="
	}
    return result
}
