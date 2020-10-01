import UIKit

struct DictionaryThatNoteUses {
    var id: String
    
    init(id: String = UUID().uuidString) {
        self.id = id
    }
}

struct Note: Hashable {
    let dictionary: DictionaryThatNoteUses
    
    var id: String {
        return dictionary.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }
}

var downloadedNoteDictionaries: [DictionaryThatNoteUses] = [
    DictionaryThatNoteUses(),
    DictionaryThatNoteUses(),
    DictionaryThatNoteUses()
]

var notesDictionary: [String: Note] = [:]
var notesSet: Set<Note> = []

// Add a dictionary with the same id as the first dictionary
downloadedNoteDictionaries.append(downloadedNoteDictionaries.first!) // so now there are four Dictionary objects in this array

func createDictionaryOfNotes() {
    func avoidCreatingDuplicateNotesObject(with id: String) {
        print("avoided creating duplicate notes object with id \(id)") // prints once because of the duplicated note at the end matching the first, so a new Note object is not instantiated
    }
    
    downloadedNoteDictionaries.forEach {
        guard notesDictionary[$0.id] == nil else { return avoidCreatingDuplicateNotesObject(with: $0.id) }
        
        let note = Note(dictionary: $0)
        notesDictionary[note.id] = note
    }
}

createDictionaryOfNotes()

// Obtain a set for set operations on those unique Note objects
notesSet = Set<Note>(notesDictionary.values)

print("number of items in dictionary = \(notesDictionary.count), number of items in set = \(notesSet.count)") // prints 3 and 3 because the 4th object was a duplicate

// Grabbing a specific element from the set
// Let's test with the second Note object from the notesDictionary
let secondNotesObjectFromDictionary = notesDictionary.values[notesDictionary.values.index(notesDictionary.values.startIndex, offsetBy: 1)]
let thirdNotesObjectFromDictionary = notesDictionary.values[notesDictionary.values.index(notesDictionary.values.startIndex, offsetBy: 2)]

if let secondNotesObjectIndexInSet = notesSet.firstIndex(of: secondNotesObjectFromDictionary) {
    print("do the two objects match: \(notesSet[secondNotesObjectIndexInSet] == secondNotesObjectFromDictionary)") // prints true
    print("does the third object from dictionary match the second object from the set: \(thirdNotesObjectFromDictionary == notesSet[secondNotesObjectIndexInSet])") // prints false
}

func uh<K>(i: K) {
    print(i is NSNull)
}

let boo: String? = nil

uh(i: boo)
