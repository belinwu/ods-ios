//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import OrangeDesignSystem
import SwiftUI

// ========================
// MARK: - Emphasis Variant
// ========================

struct EmphasisVariant: View {

    // =======================
    // MARK: Stored Properties
    // =======================

    @ObservedObject var model: EmphasisAndFunctionnalVariantModel

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        Text("screens.components.buttons.variant.emphasis.description")
            .odsFont(.bodyLRegular)
            .padding(.bottom, ODSSpacing.xs)
            .frame(maxWidth: .infinity, alignment: .leading)

        ForEach(ODSButton.Emphasis.allCases, id: \.rawValue) { emphasis in
            VStack(alignment: .center, spacing: ODSSpacing.s) {
                HStack {
                    Text("\(emphasis.rawValue)".capitalized)
                        .odsFont(.headlineS)
                    Spacer()
                }
                .accessibilityAddTraits(.isHeader)

                ODSButton(text: Text(model.text),
                          image: model.icon,
                          emphasis: emphasis,
                          fullWidth: model.showFullWidth) {}
                    .disabled(!model.showEnabled)
            }
        }
    }
}

// ==========================
// MARK: - Functional Variant
// ==========================

struct FunctionalVariant: View {

    // =======================
    // MARK: Stored Properties
    // =======================

    @ObservedObject var model: EmphasisAndFunctionnalVariantModel

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        Text("screens.components.buttons.variant.functional.description")
            .odsFont(.bodyLRegular)
            .padding(.bottom, ODSSpacing.xs)
            .frame(maxWidth: .infinity, alignment: .leading)

        ForEach(ODSFunctionalButton.Style.allCases, id: \.rawValue) { style in
            VStack(alignment: .center, spacing: ODSSpacing.s) {
                HStack {
                    Text(description(for: style)).odsFont(.headlineS)
                    Spacer()
                }
                .accessibilityAddTraits(.isHeader)

                ODSFunctionalButton(text: Text(model.text),
                                    image: model.icon,
                                    style: style,
                                    fullWidth: model.showFullWidth) {}
                    .disabled(!model.showEnabled)
            }
        }
    }

    // ====================
    // MARK: Private helper
    // ====================

    private func description(for style: ODSFunctionalButton.Style) -> String {
        switch style {
        case .negative: return °°"screens.components.buttons.styles.description.negative"
        case .positive: return °°"screens.components.buttons.styles.description.positive"
        }
    }
}

// ========================================
// MARK: - Emphasis and Functionnal Variant
// ========================================

final class EmphasisAndFunctionnalVariantModel: ObservableObject {

    // =======================
    // MARK: Stored Properties
    // =======================

    @Published var showIcon: Bool
    @Published var showFullWidth: Bool
    @Published var showLongText: Bool
    @Published var showEnabled: Bool

    // =================
    // MARK: Initializer
    // =================

    init() {
        showIcon = false
        showFullWidth = false
        showLongText = false
        showEnabled = true
    }

    // =====================
    // MARK: Computed values
    // =====================

    var text: LocalizedStringKey {
        showLongText ? "screens.components.buttons.variant.long" : (showEnabled ? "shared.enabled" : "shared.disabled")
    }

    var icon: Image? {
        showIcon ? Image("Add") : nil
    }
}

struct EmphasisAndFunctionalVariantOptions: View {

    // =======================
    // MARK: Stored properties
    // =======================

    @ObservedObject var model: EmphasisAndFunctionnalVariantModel

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        VStack {
            Toggle("shared.icon", isOn: $model.showIcon)
            Toggle("screens.components.buttons.options.toggle.full_width", isOn: $model.showFullWidth)
            Toggle("shared.enabled", isOn: $model.showEnabled)
            Toggle("shared.long_text", isOn: $model.showLongText)
        }
        .padding(.horizontal, ODSSpacing.m)
        .padding(.vertical, ODSSpacing.s)
    }
}
