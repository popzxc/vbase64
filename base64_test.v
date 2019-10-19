import base64

struct TestCase {
    input string
    expected string
}

fn string_to_bytes(data string) []byte {
     mut buf := []byte

    for chr in data {
        buf << chr
    }

    return buf
}

fn test_encode() {
    test_vector := [
        TestCase {
            input: ''
            expected: ''
        },
        TestCase {
            input: 'a'
            expected: 'YQ=='
        },
        TestCase {
            input: 'abcdefGHIjKLMno'
            expected: 'YWJjZGVmR0hJaktMTW5v'
        },
        TestCase {
            input: ' jkahsd jfhjfasd hfjahd jsakh jfdash ljfhdsj lhfdjash jfklasdhl jfhdsal hfdjskalh jflkdshj klfhdsla hfjdshaj lfh asjldhf jalhdsjk hfjdasl hjfkdlhasjk hjflkdsah jklfahsdjl hfjakdlshj lhjaslkdhjfk lhasdjlhf jlkasdhjfkl hajsdlhf jkaldshj kfhladsh jkfahdsjkl hfjqhefuoihjxzhxkvcbnjvgwbruiohfgisdjklvcnkxbgvlwhreuifwhdjzlvnb jblriheifuohfiujwflksdabjkvhuwieohflqhwefknbczknjxvbiurooheqfuihejvcbad jnkvbroqhuifh jdklfjb sjdvb u4i2127 8rhe9ph fg8h434jk2n fjkfneg0 923h4thn43ljtn 234890 ht89dhklsv nfjng2pg3894ht uq2uin jefnid0 hv8792htfl 2nj 43892r fisldf ug23y3r0 hgrjl nzsfdc lmvn2983h 32h;qjrka1234u879hrgjrle gl 2jhiht43 2 32ji 1hjuo342h uth3l hjkfsdhgl'
            expected: 'IGprYWhzZCBqZmhqZmFzZCBoZmphaGQganNha2ggamZkYXNoIGxqZmhkc2ogbGhmZGphc2ggamZrbGFzZGhsIGpmaGRzYWwgaGZkanNrYWxoIGpmbGtkc2hqIGtsZmhkc2xhIGhmamRzaGFqIGxmaCBhc2psZGhmIGphbGhkc2prIGhmamRhc2wgaGpma2RsaGFzamsgaGpmbGtkc2FoIGprbGZhaHNkamwgaGZqYWtkbHNoaiBsaGphc2xrZGhqZmsgbGhhc2RqbGhmIGpsa2FzZGhqZmtsIGhhanNkbGhmIGprYWxkc2hqIGtmaGxhZHNoIGprZmFoZHNqa2wgaGZqcWhlZnVvaWhqeHpoeGt2Y2JuanZnd2JydWlvaGZnaXNkamtsdmNua3hiZ3Zsd2hyZXVpZndoZGp6bHZuYiBqYmxyaWhlaWZ1b2hmaXVqd2Zsa3NkYWJqa3ZodXdpZW9oZmxxaHdlZmtuYmN6a25qeHZiaXVyb29oZXFmdWloZWp2Y2JhZCBqbmt2YnJvcWh1aWZoIGpka2xmamIgc2pkdmIgdTRpMjEyNyA4cmhlOXBoIGZnOGg0MzRqazJuIGZqa2ZuZWcwIDkyM2g0dGhuNDNsanRuIDIzNDg5MCBodDg5ZGhrbHN2IG5mam5nMnBnMzg5NGh0IHVxMnVpbiBqZWZuaWQwIGh2ODc5Mmh0ZmwgMm5qIDQzODkyciBmaXNsZGYgdWcyM3kzcjAgaGdyamwgbnpzZmRjIGxtdm4yOTgzaCAzMmg7cWpya2ExMjM0dTg3OWhyZ2pybGUgZ2wgMmpoaWh0NDMgMiAzMmppIDFoanVvMzQyaCB1dGgzbCBoamtmc2RoZ2w='
        }
    ]

    for test in test_vector {
        res := base64.base64_encode(string_to_bytes(test.input))
        assert res == test.expected
    }
}

fn test_decode() {
    test_vector := [
        TestCase {
            input: ''
            expected: ''
        },
        TestCase {
            input: 'YQ=='
            expected: 'a'
        },
        TestCase {
            input: 'YWJjZGVmR0hJaktMTW5v'
            expected: 'abcdefGHIjKLMno'
        },
        TestCase {
            input: 'IGprYWhzZCBqZmhqZmFzZCBoZmphaGQganNha2ggamZkYXNoIGxqZmhkc2ogbGhmZGphc2ggamZrbGFzZGhsIGpmaGRzYWwgaGZkanNrYWxoIGpmbGtkc2hqIGtsZmhkc2xhIGhmamRzaGFqIGxmaCBhc2psZGhmIGphbGhkc2prIGhmamRhc2wgaGpma2RsaGFzamsgaGpmbGtkc2FoIGprbGZhaHNkamwgaGZqYWtkbHNoaiBsaGphc2xrZGhqZmsgbGhhc2RqbGhmIGpsa2FzZGhqZmtsIGhhanNkbGhmIGprYWxkc2hqIGtmaGxhZHNoIGprZmFoZHNqa2wgaGZqcWhlZnVvaWhqeHpoeGt2Y2JuanZnd2JydWlvaGZnaXNkamtsdmNua3hiZ3Zsd2hyZXVpZndoZGp6bHZuYiBqYmxyaWhlaWZ1b2hmaXVqd2Zsa3NkYWJqa3ZodXdpZW9oZmxxaHdlZmtuYmN6a25qeHZiaXVyb29oZXFmdWloZWp2Y2JhZCBqbmt2YnJvcWh1aWZoIGpka2xmamIgc2pkdmIgdTRpMjEyNyA4cmhlOXBoIGZnOGg0MzRqazJuIGZqa2ZuZWcwIDkyM2g0dGhuNDNsanRuIDIzNDg5MCBodDg5ZGhrbHN2IG5mam5nMnBnMzg5NGh0IHVxMnVpbiBqZWZuaWQwIGh2ODc5Mmh0ZmwgMm5qIDQzODkyciBmaXNsZGYgdWcyM3kzcjAgaGdyamwgbnpzZmRjIGxtdm4yOTgzaCAzMmg7cWpya2ExMjM0dTg3OWhyZ2pybGUgZ2wgMmpoaWh0NDMgMiAzMmppIDFoanVvMzQyaCB1dGgzbCBoamtmc2RoZ2w='
            expected: ' jkahsd jfhjfasd hfjahd jsakh jfdash ljfhdsj lhfdjash jfklasdhl jfhdsal hfdjskalh jflkdshj klfhdsla hfjdshaj lfh asjldhf jalhdsjk hfjdasl hjfkdlhasjk hjflkdsah jklfahsdjl hfjakdlshj lhjaslkdhjfk lhasdjlhf jlkasdhjfkl hajsdlhf jkaldshj kfhladsh jkfahdsjkl hfjqhefuoihjxzhxkvcbnjvgwbruiohfgisdjklvcnkxbgvlwhreuifwhdjzlvnb jblriheifuohfiujwflksdabjkvhuwieohflqhwefknbczknjxvbiurooheqfuihejvcbad jnkvbroqhuifh jdklfjb sjdvb u4i2127 8rhe9ph fg8h434jk2n fjkfneg0 923h4thn43ljtn 234890 ht89dhklsv nfjng2pg3894ht uq2uin jefnid0 hv8792htfl 2nj 43892r fisldf ug23y3r0 hgrjl nzsfdc lmvn2983h 32h;qjrka1234u879hrgjrle gl 2jhiht43 2 32ji 1hjuo342h uth3l hjkfsdhgl'
        }
    ]

    for test in test_vector {
        res := base64.base64_decode(test.input) or {
            panic("Fail")
        }
        assert string(res) == test.expected
    }
}

fn test_decode_error() {
    incorrect_string := 'abcd,,,....'

    res := base64.base64_decode(incorrect_string) or {
        return
    }

    panic("Fail: got unexpected $res")
}

fn test_roundtrip_all_bytes() {
    mut all_possible_bytes := []byte
    mut i := 0
    for i < 256 {
        all_possible_bytes << byte(i)
        i += 1
    }

    encoded := base64.base64_encode(all_possible_bytes)
    decoded := base64.base64_decode(encoded) or {
        panic("Fail")
    }

    assert string(all_possible_bytes) == string(decoded)
}
