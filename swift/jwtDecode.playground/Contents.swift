import UIKit

func decode(jwtToken jwt: String) -> [String: Any] {
    let value = jwt.components(separatedBy: ".")[1]
    guard let data = Data(base64Encoded: value + String(repeating: "=", count: (value.count % 4))),
        let json =  try? JSONSerialization.jsonObject(with: data, options: []),
        let payload = json as? [String: Any]
        else { return [:] }
    
    return payload
}

let idToken = "eyJraWQiOiJlWGF1bm1MIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJodHRwczovL2FwcGxlaWQuYXBwbGUuY29tIiwiYXVkIjoiY29tLnNsaWNrZGVhbHMubW9iaWxlIiwiZXhwIjoxNTkxMDM3MzgxLCJpYXQiOjE1OTEwMzY3ODEsInN1YiI6IjAwMjAyOS41NDEyNDMzMjdiNzM0MTE1YWUwZTkxZjY3NmE2OGM4OC4wMDU3IiwiY19oYXNoIjoibWJ2a3dkR3I1MkZtWHBXSHlmeGJqZyIsImVtYWlsIjoiNG55ajl2N3Fjc0Bwcml2YXRlcmVsYXkuYXBwbGVpZC5jb20iLCJlbWFpbF92ZXJpZmllZCI6InRydWUiLCJpc19wcml2YXRlX2VtYWlsIjoidHJ1ZSIsImF1dGhfdGltZSI6MTU5MTAzNjc4MSwibm9uY2Vfc3VwcG9ydGVkIjp0cnVlfQ.3_HCaq1EKX8hy5M4o9ijBF-23qu8Py45VwDynEY9FjzQPo2KN3PHWSf7CVZt3F7Hnsu4jiuEV0Tx3nRCbsai9wcZg9f1Tqmw0PGmWc0yWVmiX36p9HTerH_45Ts9tliQQtCetL03LliL_JBD2liMA_k--7osd9oHEw2AnyIPAkzrKnkGnHzadqqgVV0alebINwoU3_AmNASlUnWa57YfvtiJW08M5AZkod-rrpZBG5VA9g2xqTiqxhLyOFhIJ_nwgSGieR6Go1Iuo5hf-HNVO4ZlWNS9AHo46gdOP2XSXCJtRKZtGpfVOnA--PHdMC-YL4Ws-zOKyDH5_faZRP9pgA"

decode(jwtToken: idToken)
