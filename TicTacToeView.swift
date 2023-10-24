//
//  TicTacToeView.swift
//  TicTacToe
//
//  Created by Shweta Gupta on 16/10/23.
//

import SwiftUI

struct TicTacToeView: View {
    @State private var board = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @State private var currentPlayer = "X"
    @State private var gameResult = ""
    var body: some View {
        GeometryReader { geo in
            VStack{
                Text("Tic-Tac-Toe")
                    .font(.largeTitle)
                    .padding()
                
                VStack{
                    ForEach(0..<3,id:\.self){
                        row in
                        HStack{
                            ForEach(0..<3,id:\.self) { col in
                                
                                Button(action: {
                                    if board[row][col] == ""{
                                        board[row][col] = currentPlayer
                                        currentPlayer = (currentPlayer == "X") ? "O" : "X"
                                    }
                                    gameResult = checkGameResult()
                                }){
                                    Text(board[row][col])
                                        .font(.largeTitle)
                                        .frame(width: 50,height: 50)
                                        .border(Color.white)
                                       
                                }
                            }
                        }.background(Color(uiColor: .black))
                    }
                }.background(Color(uiColor: .black))
                Text("Current Player : \(currentPlayer)")
                
                Text(gameResult)
                    .font(.title)
                    .padding()
            }.background(Color(uiColor: .black))
                .foregroundColor(Color(uiColor: .white))
                .frame(width: geo.size.width,height:geo.size.height)
                
        }
    }
    
    func checkGameResult() -> String{
        
        for i in 0..<3{
            
            if board[i][0] == currentPlayer && board[i][1] == currentPlayer && board[i][2] == currentPlayer{
                return "Player \(currentPlayer) wins!"
            }
            
            if board[0][i] == currentPlayer && board[1][i] == currentPlayer && board[2][i] == currentPlayer {
                return "Player \(currentPlayer) wins!"
            }
        }
            
            if (board[0][0] == currentPlayer && board[1][1] == currentPlayer && board[2][2] == currentPlayer) || (board[0][2] == currentPlayer && board[1][1] == currentPlayer && board[2][0] == currentPlayer){
                return "Player \(currentPlayer) wins!"
            }
            
            let isBoardFull = !board.joined().contains("")
            if isBoardFull{
                return "It's a draw!"
            }
        
        return ""
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
