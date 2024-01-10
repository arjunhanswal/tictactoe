//
//  TicModelTests.swift
//  TicTacToeTDDTests
//
//  Created by Kavita on 04/01/24.
//  Copyright © 2024 test. All rights reserved.
//

import XCTest
@testable import TicTacToeTDD
// 123456789
class TicModelTests: XCTestCase {
  
  func test_initialValue_nineCells() {
    // Arrange
    let ticModel = TicModel()// fail 
    // Act
    
    // Assert
    XCTAssertEqual(ticModel.grid.count, 9)
  }
   
  func test_initialValue_nineBlankCells() {
    // Arrange
    let ticModel = TicModel()
    
    // Act
    
    // Assert
    XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 9)
  }
  
  func test_setCellTwice_ignoreSecond() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    ticModel.setCell(n: 3, c: .x)
    ticModel.setCell(n: 3, c: .o)
    
    // Assert
    XCTAssertTrue(ticModel.grid[3] == Cell.x)
    XCTAssertEqual((ticModel.grid.filter { $0 == Cell.x }.count), 1)
    XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 8)
    
  }
  
  func test_initialGame_isNotWon() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    let result = ticModel.updateGameStatus()
    
    // Assert
    XCTAssertFalse(result)
  }
  
  func test_topLineX_xIsWinner() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    for i in [0,1,2] {
      ticModel.setCell(n: i, c: .x)
    }
    let result = ticModel.updateGameStatus()
    
    // Assert
    XCTAssertTrue(result)
    XCTAssertEqual(Winner.x, ticModel.winner)
  }
  
  func test_middleLineX_xIsWinner() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    for i in [3,4,5] {
      ticModel.setCell(n: i, c: .x)
    }
    let result = ticModel.updateGameStatus()
    
    // Assert
    XCTAssertTrue(result)
    XCTAssertEqual(Winner.x, ticModel.winner)
  }
  
  func test_bottomLineX_xIsWinner() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    for i in [6,7,8] {
      ticModel.setCell(n: i, c: .x)
    }
    let result = ticModel.updateGameStatus()
    
    // Assert
    XCTAssertTrue(result)
    XCTAssertEqual(Winner.x, ticModel.winner)
  }
  
  func test_leftLineO_oIsWinner() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    for i in [0,3,6] {
      ticModel.setCell(n: i, c: .o)
    }
    let result = ticModel.updateGameStatus()
    
    // Assert
    XCTAssertTrue(result)
    XCTAssertEqual(Winner.o, ticModel.winner)
  }
  
  func test_middleLineO_oIsWinner() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    for i in [1,4,7] {
      ticModel.setCell(n: i, c: .o)
    }
    let result = ticModel.updateGameStatus()
    
    // Assert
    XCTAssertTrue(result)
    XCTAssertEqual(Winner.o, ticModel.winner)
  }
  
  func test_rightLineO_oIsWinner() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    for i in [2,5,8] {
      ticModel.setCell(n: i, c: .o)
    }
    let result = ticModel.updateGameStatus()
    
    // Assert
    XCTAssertTrue(result)
    XCTAssertEqual(Winner.o, ticModel.winner)
  }
  
  func test_diagonalO_oIsWinner() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    for i in [0,4,8] {
      ticModel.setCell(n: i, c: .o)
    }
    let result = ticModel.updateGameStatus()
    
    // Assert
    XCTAssertTrue(result)
    XCTAssertEqual(Winner.o, ticModel.winner)
  }
  
  func test_diagonalX_xIsWinner() {
    // Arrange
    var ticModel = TicModel()
    
    // Act
    for i in [0,4,8] {
      ticModel.setCell(n: i, c: .x)
    }
    let result = ticModel.updateGameStatus()
    
    // Assert
    XCTAssertTrue(result)
    XCTAssertEqual(Winner.x, ticModel.winner)
  }
}
