//
//  RatingsView.swift
//  custom
//
//  Created by William Hettinger on 4/21/24.
//

import SwiftUI
/// A view of inline imageaa that represent a rating
/// Tapping on an image will change it from an unfilled to a filled version of the image
///
/// The following example shows a ratings view with a max of 3 hearts
///  bound to heartRating property and a width of 50 specified
///
///  RatingsView(
///  maxRating: 3,
///  currentRating: $heartRating,
///  width: 50,
///  symbol: "heart" an sfsymbol,
///  color: .red
/// )
struct RatingsView: View {
    let maxRating: Int
    @Binding var currentRating: Int
    let width: Int
    let symbol: String?
    let symbolEnum: Symbol?
    let color: Color
    
    var symbolString: String
    
    init(
        maxRating: Int,
        currentRating: Binding<Int>,
        width: Int = 30,
        symbol: String? = "star",
        color: Color = .yellow
        
    ) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.symbol = symbol
        self.symbolEnum = nil
        self.color = color
        
        symbolString = if let symbolEnum {symbolEnum.rawValue} else {symbol!}
    }
    
    var body: some View {
        HStack{
            Image(systemName: "x.circle")
                .resizable()
                .scaledToFit()
                .foregroundStyle(color)
                //.symbolVariant(.slash)
                .opacity(currentRating == 0 ? 0:1)
                .onTapGesture {
                    withAnimation {
                        currentRating = 0
                    }
                }
            ForEach(0..<maxRating, id: \.self) {rating in
                Image(systemName: symbolString)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(color)
                    .symbolVariant(rating<currentRating ? .fill :.none)
                    .onTapGesture {
                        withAnimation {
                            currentRating = rating + 1
                        }
                    }
            }
        }
        .frame(width: CGFloat(maxRating*width))
    }
}

#Preview {
    struct PreviewWrapper: View {
        let maxRating = 5
        @State var currentRating = 2
        var body: some View {
            RatingsView(
                maxRating: maxRating,
                currentRating: $currentRating
            )
        }
    }
    return PreviewWrapper()
}

extension RatingsView {
    /// A view of inline imageaa that represent a rating
    /// Tapping on an image will change it from an unfilled to a filled version of the image
    ///
    /// The following example shows a ratings view with a max of 3 hearts
    ///  bound to heartRating property and a width of 50 specified
    ///
    ///  RatingsView(
    ///  maxRating: 3,
    ///  currentRating: $heartRating,
    ///  width: 50,
    ///  symbol: a selection of SFSymbols,
    ///  color: .red
    ///
        
        init(
            maxRating: Int,
            currentRating: Binding<Int>,
            width: Int = 30,
            symbolEnum: Symbol?,
            color: Color = .yellow
            
        ) {
            self.maxRating = maxRating
            self._currentRating = currentRating
            self.width = width
            self.symbol = nil
            self.symbolEnum = symbolEnum
            self.color = color
            
            symbolString = if let symbolEnum {symbolEnum.rawValue} else {symbol!}
        }
        

}

enum Symbol: String {
    case bell
    case bookmark
    case diamond
    case eye
    case flag
    case heart
    case pencil
    case person
    case pin
    case star
    case thumbsUp = "hand.thumbsup"
    case tag
    case trash
}
