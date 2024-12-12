//
//  Palindrome.swift
//  BezelTivis
//
//  Created by Daniel Prastiwa on 12/12/24.
//

import Foundation


protocol PalindromeHandler {
  func isPalindrome(word: String) -> Bool
}

public struct PalindromeHandlerImpl: PalindromeHandler {

  public init() {}

  public func isPalindrome(word: String) -> Bool {
    return _isPalindromeRecursive(word: word, startAt: 0)
  }

  private func _isPalindromeRegularApproach(word: String) -> Bool {
    let lastIndex = word.count - 1
    let lastStringIndex = word.index(word.startIndex, offsetBy: lastIndex)
    let firstStringIndex = word.index(word.startIndex, offsetBy: 0)
    guard word[firstStringIndex] == word[lastStringIndex] else {
      return false
    }

    let reversedWord = reverseWord(word)
    guard word == reversedWord else {
      return false
    }

    return true
  }

  private func _isPalindromeOptimized(word: String) -> Bool {
    for i in 0 ..< word.count / 2 {
      let trailOffset = word.count - i - 1
      let rightIndex = word.index(word.startIndex, offsetBy: trailOffset)
      let leftIndex = word.index(word.startIndex, offsetBy: i)
      let leftWord = word[leftIndex]
      let rightWord = word[rightIndex]
      if leftWord != rightWord {
        return false
      }
    }
    return true
  }

  private func _isPalindromeRecursive(
    word: String,
    startAt position: Int
  ) -> Bool {
    if position < word.count / 2 {
      let trailOffset = word.count - position - 1
      let trailIndex = word.index(word.startIndex, offsetBy: trailOffset)
      let leadIndex = word.index(word.startIndex, offsetBy: position)
      let leadWord = word[leadIndex]
      let trailWord = word[trailIndex]
      if leadWord != trailWord {
        return false
      }
      return _isPalindromeRecursive(word: word, startAt: position + 1)
    }
    return true
  }

  private func reverseWord(_ word: String) -> String {
    var lastIndexWord = word.count - 1
    var characterResults = [Character?](repeating: nil, count: word.count)

    for i in 0 ..< word.count {
      let stringIndex = word.index(word.startIndex, offsetBy: lastIndexWord)
      let character = word[stringIndex]
      characterResults[i] = character
      lastIndexWord -= 1
    }

    let wordResult = characterResults
      .map { String(describing: $0!) }
      .joined()

    return wordResult
  }

}
