//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import OrangeDesignSystem
import SwiftUI

// ======================
// MARK: - Card Component
// ======================

struct CardComponent: Component {
    let name: String
    let imageName: String
    let description: String
    let variants: AnyView

    init() {
        name = °°"screens.components.cards.title"
        imageName = "Cards_1"
        description = °°"screens.components.cards.description"
        variants = AnyView(CardVariants())
    }
}

// =====================
// MARK: - Card Variants
// =====================

struct CardVariants: View {

    var body: some View {
        VariantEntryItem(title: "screens.components.cards.variant.vertical_image_first", technicalElement: "ODSCardVerticalImageFirst()") {
            CardVerticalImageFirstVariant(model: CardVerticalImageFirstVariantModel())
                .navigationTitle("screens.components.cards.variant.vertical_image_first")
        }

        VariantEntryItem(title: "screens.components.cards.variant.vertical_header_first", technicalElement: "ODSCardVerticalHeaderFirst()") {
            CardVerticalHeaderFirstVariant(model: CardVerticalHeaderFirstVariantModel())
                .navigationTitle("screens.components.cards.variant.vertical_header_first")
        }

        VariantEntryItem(title: "screens.components.cards.variant.small", technicalElement: "ODSCardSmall") {
            CardSmallVariant(model: CardSmallVariantModel())
                .navigationTitle("screens.components.cards.variant.small")
        }

        VariantEntryItem(title: "screens.components.cards.variant.horizontal", technicalElement: "ODSCardHorizontal") {
            CardHorizontalVariant(model: CardHorizontalVariantModel())
                .navigationTitle("screens.components.cards.variant.horizontal")
        }
    }
}

#if DEBUG
struct CardViewDemoSandBox_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardVariants()
                .previewInterfaceOrientation(.portrait)
        }

        NavigationView {
            CardVariants()
                .previewInterfaceOrientation(.portrait)
                .environment(\.dynamicTypeSize, .accessibility3)
        }
    }
}
#endif
