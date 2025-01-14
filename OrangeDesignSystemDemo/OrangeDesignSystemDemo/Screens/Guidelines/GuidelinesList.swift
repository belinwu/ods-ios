//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import OrangeDesignSystem
import SwiftUI

struct GuidelinesList: View {

    // ======================
    // MARK: Store properties
    // ======================

    @EnvironmentObject private var themeProvider: ThemeProvider
    private let guidelines: [Guideline]
    private let columns = [GridItem(.flexible(), alignment: .topLeading)]

    init() {
        guidelines = [
            ColorsGuideline(),
            TypographyGuideline(),
            SpacingsGuideline(),
        ]
    }

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: ODSSpacing.xs) {
                    ForEach(guidelines, id: \.id) { guideline in
                        NavigationLink {
                            GuidelinePage(guideline: guideline)
                        } label: {
                            ODSCardVerticalImageFirst(
                                title: Text(guideline.name),
                                imageSource: .image(imageFrom(resourceName: guideline.imageName)))
                        }
                    }
                }
                .padding(.all, ODSSpacing.m)
                .navigationTitle("shared.guidelines")
                .navigationbarMenuForThemeSelection()
            }

            GuidelinePage(guideline: guidelines[0]) // Why ?
        }
        .navigationViewStyle(.stack)
    }

    // ====================
    // MARK: Private helper
    // ====================

    private func imageFrom(resourceName: String) -> Image {
        themeProvider.imageFromResources(resourceName)
    }
}

#if DEBUG
struct GuidelinesListView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeablePreviews {
            GuidelinesList()
        }
    }
}
#endif
