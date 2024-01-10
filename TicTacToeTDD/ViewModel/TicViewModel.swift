//
//  TicViewModel.swift
//  TicTacToeTDD
//
//  Created by Kavita on 04/01/24.
//  Copyright © 2024 test. All rights reserved.
//

import Foundation

class TicViewModel: ObservableObject {
  @Published private var ticModel: TicModel
  
  init() {
    ticModel = TicModel()
  }
  
  var grid: [Cell] {
    get { ticModel.grid }
  }
  
  var winner: Winner {
    get { ticModel.winner }
  }
  
  var isGameOver: Bool {
    get { ticModel.isGridFull || (ticModel.winner != .none) }
  }
  
  var isXTurn: Bool {
    get { ticModel.isXTurn }
  }
  
  func setCell(index: Int, cellValue: Cell) {
    ticModel.setCell(n: index, c: cellValue)
    _ = ticModel.updateGameStatus()
  }
  
  var winnerDisplay: String {
    get {
      var message = ""
      if ticModel.winner == .x {
        message = "X Wins"
      }
      else if ticModel.winner == .o {
        message = "O Wins"
      }
      else if ticModel.winner == .none && isGameOver {
        message = "Draw"
      }
      return message
    }
  }
  func reset() {
    // initialize a new model
    ticModel = TicModel()
  }
}
