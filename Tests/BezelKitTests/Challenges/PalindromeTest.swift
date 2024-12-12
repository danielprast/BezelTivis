//
//  PalindromeTest.swift
//  BezelTivis
//
//  Created by Daniel Prastiwa on 12/12/24.
//

import XCTest
@testable import BezelTivis


final class PalindromeTest: XCTestCase {

  func test_palindromeWord() {
    let sut: PalindromeHandler = PalindromeHandlerImpl()
    XCTAssertTrue(sut.isPalindrome(word: "kodok"))
    XCTAssertTrue(sut.isPalindrome(word: "katak"))
    XCTAssertTrue(sut.isPalindrome(word: "racecar"))
    XCTAssertTrue(sut.isPalindrome(word: "level"))
    XCTAssertTrue(sut.isPalindrome(word: "rotator"))
    XCTAssertFalse(sut.isPalindrome(word: "macbook"))
  }

}
