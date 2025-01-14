//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import OrangeDesignSystem
import SwiftUI

final class BannerVariantModel: ObservableObject {

    // =======================
    // MARK: Stored Properties
    // =======================

    @Published var showLongText: Bool
    @Published var showImage: Bool
    @Published var buttonCount: Int

    let buttonsText = [°°"shared.actions.action_1",
                       °°"shared.actions.action_2"]

    // =================
    // MARK: Initializer
    // =================

    init() {
        showLongText = true
        showImage = true
        buttonCount = 0
    }

    // =============
    // MARK: Helpers
    // =============

    var text: Text {
        let longText = °°"screens.components.banners.demo.long_text"
        let shortText = °°"screens.components.banners.demo.short_text"

        return Text(showLongText ? longText : shortText)
    }

    var imageSource: ODSImage.Source? {
        let placeholder = Image("ods_empty", bundle: Bundle.ods)

        if let url = RecipeBook.shared.recipes.first?.url {
            return showImage ? .asyncImage(url, placeholder) : nil
        } else {
            return showImage ? .image(placeholder) : nil
        }
    }

    var buttonText: String {
        °°"shared.actions.action"
    }

    var firstButtonText: String {
        buttonsText[0]
    }

    var secondButtonText: String {
        buttonsText[1]
    }
}

struct BannerVariantOptions: View {

    // =======================
    // MARK: Stored Properties
    // =======================

    @ObservedObject var model: BannerVariantModel

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        VStack(spacing: ODSSpacing.m) {
            Toggle("shared.long_text", isOn: $model.showLongText)
            Toggle("screens.components.banners.demo.toggle_image_hint", isOn: $model.showImage)
            Stepper("screens.components.banners.demo.buttons_number_hint" <- "\(model.buttonCount)",
                    value: $model.buttonCount,
                    in: 0 ... model.buttonsText.count)
        }
        .odsFont(.bodyLRegular)
        .padding(.horizontal, ODSSpacing.m)
        .padding(.vertical, ODSSpacing.m)
    }
}
