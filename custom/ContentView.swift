//
//  ContentView.swift
//  custom
//
//  Created by William Hettinger on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentRating = 0
    @State private var heartRating = 0
    @State private var pinRating = 0
    @State private var bookMarkRating = 0
    @State private var flagRating = 0
    
    var body: some View {
        RatingsView(
            maxRating: 5,
            currentRating: $currentRating,
            width: 40
        )
        RatingsView(
            maxRating: 3,
            currentRating: $heartRating,
            width: 50,
            symbolEnum: .heart,
            color: .red
        )
        RatingsView(
            maxRating: 5,
            currentRating: $pinRating,
            width: 40,
            symbol: "pin",
            color: .blue
        )
        RatingsView(
            maxRating: 5,
            currentRating: $bookMarkRating,
            //width: <#T##Int#>,
            symbolEnum: .bookmark,
            color: .teal
        )
        RatingsView(
            maxRating: 7,
            currentRating: $flagRating,
            width: 30,
            symbolEnum: .flag,
            color: .green
        )
//        RatingsView(
//            maxRating: 5,
//            currentRating: $bookMarkRating,
//            //width: <#T##Int#>,
//            symbolEnum: .bookmark,
//            color: .teal
//        )
    }
}

#Preview {
    ContentView()
}
