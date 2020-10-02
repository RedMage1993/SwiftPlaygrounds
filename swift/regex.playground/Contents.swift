import Foundation

// A quote from a worker converted into the first letter of every word because I'm sarcastic when I see "long" acronyms I haven't seen before

let sauce = "if you can identify in code whether or not this is the first time this particular anonymous user is being exposed to this feature, then pass an attribute to getTreatment and have a separate targeting rule for when that attribute is true. But for experimentation, I think you will want to be sure you will enough of such users to be able to meaningfully measure the effects of the treatment."
 
print(try! NSRegularExpression(pattern: "(?>(\\w)\\w* *)").stringByReplacingMatches(in: sauce, range: NSRange(sauce.startIndex..<sauce.endIndex, in: sauce), withTemplate: "$1"))

