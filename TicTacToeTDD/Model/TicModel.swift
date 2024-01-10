//
//  TicModel.swift
//  TicTacToeTDD
//
//  Created by Kavita on 04/01/24.
//  Copyright © 2024 test. All rights reserved.
//

import Foundation

enum Cell: String { // player
  case x = "X"
  case o = "O"
  case b = "" // blank full name 
}
enum Winner {
  case o, x, none
}

struct TicModel { // full name
  
 private var _grid: [Cell]
 private var _winner: Winner
 private var _playerXTurn: Bool
  
  init() {
    _grid = []
    for _ in 0..<9 {
      _grid.append(Cell.b)
    }
     _winner = .none
    _playerXTurn = true // 
  }
  
  var grid: [Cell] {
    get { _grid }
  }
  
  var winner: Winner {
    get { _winner }
  }
  var isGridFull: Bool {
    get { grid.filter { $0 == Cell.b }.count == 0 }
  }
  
  var isXTurn: Bool {
    get { _playerXTurn }
  }
  
  mutating func setCell(n:Int, c: Cell) {
    guard _grid.indices.contains(n) else {
      return
    }
    guard _grid[n] == .b else {
      return
    }
    _grid[n] = c
    _playerXTurn.toggle()
  
  }
  
  mutating func updateGameStatus() -> Bool {
    // There are 9 possible winning options in Tic Tac Toe
    
    // extract method small logic
    let winOptions: [Set<Int>] = [
      [0,1,2], [3,4,5], [6,7,8],
      [0,3,6], [1,4,7], [2,5,8],
      [0,4,8], [2,4,6]]
    
    let oCells: Set<Int> = Set(_grid.indices.map { _grid[$0] == Cell.o ? $0 : -1 })
    //higher order funtion
    let xCells: Set<Int> = Set(_grid.indices.map { _grid[$0] == Cell.x ? $0 : -1 })
    //higher order funtion
    
    for i in winOptions {
      
      if i.intersection(xCells) == i { //higher order funtion
        _winner = .x
        return true
      }
      if i.intersection(oCells) == i { //higher order funtion
        _winner = .o
        return true
      }
    }
    
    return false
  }
}
