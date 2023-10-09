////
// MIT License
// Copyright (c) 2021 Orange
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the  Software), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
//

import SwiftUI
import OrangeDesignSystem

struct GrifOfSmallCards: View {
    
    // =======================
    // MARK: Stored Properties
    // =======================

    private let cardsModels: [ODSCardSmallModel]
    
    // =================
    // MARK: Initializer
    // =================

    init() {
        cardsModels = RecipeBook.shared.recipes.map { recipe in
            return ODSCardSmallModel(
                title: recipe.title,
                imageSource: .asyncImage(recipe.url, Image("empty", bundle: Bundle.main))
            )
        }
    }

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        ScrollView {
            ODSGridOfCards(cardModels: cardsModels)
                .padding(.all, ODSSpacing.m)
        }
    }
}

#if DEBUG
struct GrifOfSmallCard_Previews: PreviewProvider {
    static var previews: some View {
        GrifOfSmallCards()
            .previewInterfaceOrientation(.portrait)
            .environment(\.dynamicTypeSize, .accessibility3)

        GrifOfSmallCards()
            .previewInterfaceOrientation(.landscapeRight)
            .environment(\.dynamicTypeSize, .accessibility3)

    }
}
#endif