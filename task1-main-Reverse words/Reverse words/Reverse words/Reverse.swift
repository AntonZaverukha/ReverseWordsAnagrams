//
//  Reverse.swift
//  Reverse words
//
//  Created by Антон Заверуха on 03.06.2022.
//  Copyright © 2022 Антон Заверуха. All rights reserved.
//

import Foundation

struct Reverse {
        
    func reverseWords(sentence: String) -> String {
        
        let allWords = sentence.components(separatedBy: " ")
        var newSentence = ""
        for word in allWords {
            if newSentence != "" {
                newSentence += " "
            }
            let reverseWord = String(word.reversed())
            newSentence += reverseWord
        }
        
        return newSentence
    }
    
    func reverseDefault(_ string: String) -> String {
        var words = string.components(separatedBy: .whitespaces)

        for (index, word) in words.enumerated() {
    
            if word.allSatisfy(\.isLetter) {
                words[index] = String(word.reversed())
                continue
            }

            if !word.contains(where: \.isLetter) { continue }

            var reversed = word.reversed().filter(\.isLetter)
            for (index, char) in word.enumerated() {
                if !char.isLetter {
                    index < reversed.endIndex ? reversed.insert(char, at: index) : reversed.append(char)
                }
            }
            words[index] = String(reversed)
        }

        return words.joined(separator: " ")
    }
    
    func reverseCustom(_ inputString: String, _ rules: String) -> String {
        if inputString.isEmpty {
            return ""
        }

        var result = ""

        for word in inputString.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") {

            var symbolsArray = word.map { String($0) }
            var left = 0
            var right = symbolsArray.count - 1

            while left < right {
                if rules.contains(symbolsArray[left]) {
                    left += 1
                } else if rules.contains(symbolsArray[right]) {
                    right -= 1
                } else {
                    symbolsArray.swapAt(left, right)

                    left += 1
                    right -= 1
                }
            }
            result += symbolsArray.joined(separator: "").appending(" ")
        }

        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
