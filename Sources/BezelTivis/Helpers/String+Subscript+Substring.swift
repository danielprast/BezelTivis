//
//  String+Subscript+Substring.swift
//  BezelTivis
//
//  Created by Daniel Prastiwa on 10/12/24.
//

import Foundation


public extension String {

  var length: Int {
    return count
  }

  func getChar(at offset: Int) -> Character {
    self[index(startIndex, offsetBy: offset)]
  }

  func substring(fromIndex: Int) -> String {
    return self[min(fromIndex, length) ..< length]
  }

  func substring(toIndex: Int) -> String {
    return self[0 ..< max(0, toIndex)]
  }

  subscript (i: Int) -> String {
    return self[i ..< i + 1]
  }

  subscript (r: Range<Int>) -> String {
    let range = Range(
      uncheckedBounds: (
        lower: max(0, min(length, r.lowerBound)),
        upper: min(length, max(0, r.upperBound))
      )
    )
    let start = index(startIndex, offsetBy: range.lowerBound)
    let end = index(start, offsetBy: range.upperBound - range.lowerBound)
    return String(self[start ..< end])
  }
}
