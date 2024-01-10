//
//  TicTacToeView.swift
//  TicTacToeTDD
//
//  Created by Kavita on 04/01/24.
//  Copyright © 2024 test. All rights reserved.
//

import SwiftUI

struct TicTacToeView: View {
  @ObservedObject private var ticVm: TicViewModel
  let n = 3
 
  private func getindex(_ row: Int, _ column: Int) -> Int {
    return (row * n) + column
  }
  
  init() {
    ticVm = TicViewModel()
  }
    var body: some View {
      VStack (spacing: 20){
        Text("Tic Tac Toe Game")
        VStack(spacing:3) {
         // small view
          ForEach(0..<n, id:\.self) { row in
            HStack(spacing:3) {
              ForEach(0..<self.n, id:\.self) { column in
                
                Button(action: {
                  // set the cell to X or O
                  self.ticVm.setCell(index: self.getindex(row, column),
                                     cellValue: self.ticVm.isXTurn ? .x : .o)
                }) {
                  ZStack {
                    RoundedRectangle(cornerRadius: 10)
                      .stroke(Color.green, lineWidth:5)
                    VStack {
                      Text("\(self.ticVm.grid[self.getindex(row, column)].rawValue)")
                    }
                  }
                  .frame(width: 80, height: 80)
                }
              }
            }
          }
        }
        if ticVm.isGameOver {
          Text("GAME OVER !")
            .fontWeight(.bold)
          Text(ticVm.winnerDisplay)
            .fontWeight(.bold)
        }
        
        Button("New Game", action: ticVm.reset)
        Spacer()
      }
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
