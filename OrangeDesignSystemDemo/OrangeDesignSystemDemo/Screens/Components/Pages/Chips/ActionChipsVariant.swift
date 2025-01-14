//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import OrangeDesignSystem
import SwiftUI

final class ActionChipVariantModel: ObservableObject {
    @Published var showEnabled: Bool = true
}

struct ActionChipVariant: View {

    // =======================
    // MARK: Stored properties
    // =======================

    @ObservedObject private var model: ActionChipVariantModel
    @State private var showText: String?
    private let food: Food

    // =================
    // MARK: Initializer
    // =================

    init(model: ActionChipVariantModel) {
        self.model = model
        food = RecipeBook.shared.foods[0]
    }

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        CustomizableVariant {
            Toastable(showText: $showText) {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: ODSSpacing.m) {
                        Text("screens.components.chips.action.description")
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ODSActionChip(
                            text: Text(food.name),
                            leadingIcon: Image("FoodsAndEntertainment"),
                            action: { showText = "screens.components.chips.variant.chip.clicked".localized(with: food.name)
                            })
                            .disabled(!model.showEnabled)
                    }
                    .padding(.all, ODSSpacing.m)
                }
            }
        } options: {
            ActionChipVariantOptions(model: model)
        }
    }
}

struct ActionChipVariantOptions: View {

    // =======================
    // MARK: Stored properties
    // =======================

    @ObservedObject var model: ActionChipVariantModel

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        VStack {
            Toggle("shared.enabled", isOn: $model.showEnabled)
        }
        .odsFont(.bodyLBold)
        .padding(.horizontal, ODSSpacing.m)
        .padding(.vertical, ODSSpacing.s)
    }
}
