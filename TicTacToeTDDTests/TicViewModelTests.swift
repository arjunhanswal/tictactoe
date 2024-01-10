//
//  TicViewModelTests.swift
//  TicTacToeTDDTests
//
//  Created by Kavita on 04/01/24.
//  Copyright © 2024 test. All rights reserved.
//

import XCTest
@testable import TicTacToeTDD

class TicViewModelTests: XCTestCase {

  func test_initialValue_nineCells() {
    // Arrange
    let ticViewModel = TicViewModel()
    // Act
    
    // Assert
    XCTAssertEqual(ticViewModel.grid.count, 9)
  }
  
  func test_initialValue_nineBlankCells() {
    // Arrange
    let ticModel = TicModel()
    
    // Act
    
    // Assert
    XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 9)
  }
  
  func test_initialValue_noWinner() {
    // Arrange
    let ticViewModel = TicViewModel()
    
    // Act
    
    // Assert
    XCTAssertEqual(Winner.none, ticViewModel.winner)
  }
  
  func test_draw_winnerDisplayDraw() {
    // Arrange
    let ticViewModel = TicViewModel()
    
    // Act
    let fullGrid: [Cell] = [.x, .o, .x,
                            .x, .x, .o,
                            .o, .x, .o]
    for (n,c) in zip(0..<9, fullGrid) {
      ticViewModel.setCell(index: n, cellValue: c)
    }
    // Assert
    XCTAssertTrue(ticViewModel.isGameOver)
    XCTAssertEqual("Draw", ticViewModel.winnerDisplay)
  }
  
  func test_reset_gridEmpty() {
    // Arrange
    let ticViewModel = TicViewModel()
    
    // Act
    ticViewModel.reset()
    
    // Assert
    XCTAssertEqual(ticViewModel.grid.count, 9)
    XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
  }
  func test_resetAfterOne_gridEmpty() {
    // Arrange
    let ticViewModel = TicViewModel()
    
    // Act
    ticViewModel.setCell(index: 0, cellValue: .x)
    ticViewModel.reset()
    
    // Assert
    XCTAssertEqual(ticViewModel.grid.count, 9)
    XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
  }
  
  func test_resetGameOver_gridEmpty() {
    // Arrange
    let ticViewModel = TicViewModel()
    
    // Act
    let fullGrid: [Cell] = [.x, .o, .x,
                            .x, .x, .o,
                            .o, .x, .o]
    for (n,c) in zip(0..<9, fullGrid) {
      ticViewModel.setCell(index: n, cellValue: c)
    }
    ticViewModel.reset()
    
    // Assert
    XCTAssertEqual(ticViewModel.grid.count, 9)
    XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
  }
}
