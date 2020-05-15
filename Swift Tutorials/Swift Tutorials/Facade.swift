//
//  Facade.swift
//  Swift Tutorials
//
//  Created by Sedrick Cashaw Jr on 5/14/20.
//  Copyright © 2020 Sedrick Cashaw. All rights reserved.
//

import NaturalLanguage
import UIKit

// MARK: Facade - Simplifes the usage of complex types
/* Acts as a middle man between UI and component trying to simplify. Example sdk that constantly change from "beta"
 Avoid: Exposing to much detail about the type you are trying to simplify, adding to many responsibilites
 */

@available(iOS 12.0, *)
public class NLPFacade {
    private static let tagger = NLTagger(tagSchemes: [NLTagScheme.lexicalClass])
    public class func dominantLanguage(for string: String) -> String? {
        let language = NLLanguageRecognizer.dominantLanguage(for: string)
        return language?.rawValue
    }
    
    public struct WordLexicalClassPair: CustomStringConvertible {
        var word: String
        var lexicalClass: String
        public var description: String {
            return "\(word): \(lexicalClass)"
        }
    }
    
    public class func partsOfSpeech(for text: String) -> [WordLexicalClassPair] {
        var result = [WordLexicalClassPair]()
        tagger.string = text
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: NLTokenUnit.word, scheme: NLTagScheme.lexicalClass, options: [.omitPunctuation, .omitWhitespace], using: {(tag, range) -> Bool in
            let wordLexicalClass = WordLexicalClassPair(word: String(text[range]), lexicalClass: (tag?.rawValue ?? "unknown"))
            result.append(wordLexicalClass)
            return true
        })
        return result
    }
}

//Use Facade
/*let text = "he Facade is simple yet usefull"
let language = NLPFacade.dominantLanguage(for: text)
let partsOfSpeechFromText = NLPFacade.partsOfSpeech(for: text)
*/
