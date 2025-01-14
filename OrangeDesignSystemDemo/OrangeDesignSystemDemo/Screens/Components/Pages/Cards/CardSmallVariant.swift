//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import OrangeDesignSystem
import SwiftUI

final class CardSmallVariantModel: ObservableObject {

    // =======================
    // MARK: Stored properties
    // =======================

    @Published var showSubtitle: Bool = true
}

struct CardSmallVariant: View {

    // =======================
    // MARK: Stored properties
    // =======================

    @ObservedObject var model: CardSmallVariantModel
    @State private var showAlert: Bool = false

    let columns = [
        GridItem(.adaptive(minimum: 150.0), spacing: ODSSpacing.none, alignment: .topLeading),
        GridItem(.flexible(minimum: 50.0)),
    ]

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        CustomizableVariant {
            ScrollView {
                LazyVGrid(columns: columns, spacing: ODSSpacing.none) {
                    ODSCardSmall(
                        title: Text(cardExampleTitle),
                        imageSource: cardExampleImage,
                        subtitle: model.showSubtitle ? Text(cardExampleSubtitle) : nil)
                        .onTapGesture {
                            showAlert = true
                        }
                }
            }
            .padding(.horizontal, ODSSpacing.m)
            .padding(.top, ODSSpacing.m)
        } options: {
            CardSmallVariantOptions(model: model)
        }
        .alert("screens.components.card.alert", isPresented: $showAlert) {
            Button("shared.close", role: .cancel) {}
        }
    }
}

// MARK: Bottom Sheet content
private struct CardSmallVariantOptions: View {

    // =======================
    // MARK: Stored properties
    // =======================

    @ObservedObject var model: CardSmallVariantModel

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        Toggle("shared.subtitle", isOn: $model.showSubtitle)
            .odsFont(.bodyLRegular)
            .padding(.horizontal, ODSSpacing.m)
            .padding(.vertical, ODSSpacing.m)
    }
}

#if DEBUG
struct CardSmallVariant_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardSmallVariant(model: CardSmallVariantModel())
        }
    }
}
#endif
