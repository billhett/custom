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
///  symbol: "heart",
///  color: .red
/// )
struct RatingsView: View {
    let maxRating: Int
    @Binding var currentRating: Int
    let width: Int
    let symbol: String
    let color: Color
    
    init(
        maxRating: Int,
        currentRating: Binding<Int>,
        width: Int = 30,
        symbol: String = "star",
        color: Color = .yellow
        
    ) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.symbol = symbol
        self.color = color
    }
    
    var body: some View {
        HStack{
            Image(systemName: symbol)
                .resizable()
                .scaledToFit()
                .foregroundStyle(color)
                .symbolVariant(.slash)
                .opacity(currentRating == 0 ? 0:1)
                .onTapGesture {
                    withAnimation {
                        currentRating = 0
                    }
                }
            ForEach(0..<maxRating, id: \.self) {rating in
                Image(systemName: symbol)
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
