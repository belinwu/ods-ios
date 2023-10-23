//
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

import OrangeDesignSystem
import SwiftUI

struct ListItemStandardVariant: View {

    // =======================
    // MARK: Stored Properties
    // =======================
    
    let model: ListItemStandardVariantModel
    
    // ==========
    // MARK: Body
    // ==========
    
    var body: some View {
        CustomizableVariant {
            ListItemStandardVariantInner(model: model)
        } options: {
            ListItemStandardVariantOptions(model: model)
        }
    }
}

private struct ListItemStandardVariantInner: View {

    // =======================
    // MARK: Stored Properties
    // =======================

    @ObservedObject var model: ListItemStandardVariantModel
    @State private var showAlert: Bool = false
    private let recipe: Recipe = RecipeBook.shared.recipes[0]

    // ==========
    // MARK: Body
    // ==========
    
    var body: some View {
        List {
            if model.navigate {
                NavigationLink {
                    Text("Bon appetit!")
                } label: {
                    listItem
                }
                .odsListItemStyle()
            } else {
                listItem
                    .odsListItemStyle()
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .alert("Information icon tapped! Bon appétit", isPresented: $showAlert) {
            Button("close", role: .cancel) {}
        }
    }
    
    // =====================
    // MARK: Private helpers
    // =====================

    @ViewBuilder
    private var listItem: some View {
        let showText = model.trailingOptions.contains { $0 == .text }
        let showIButton = model.trailingOptions.contains { $0 == .iButton }
        
        switch (showText, showIButton) {
        case (true, true):
            ODSListItem(
                title: title,
                subtitle: subtitle,
                leading: leading,
                trailingText: Text("Details")) {
                    iButtonAction()
                }
        case (true, false):
            ODSListItem(
                title: title,
                subtitle: subtitle,
                leading: leading,
                trailingText: Text("Details")
            )

        case (false, true):
            ODSListItem(
                title: title,
                subtitle: subtitle,
                leading: leading) {
                    iButtonAction()
                }

        case (false, false):
            ODSListItem(
                title: title,
                subtitle: subtitle,
                leading: leading
            )
        }
    }
            
    private var title: Text {
        Text(recipe.title)
    }
    
    private var subtitle: Text? {
        if model.showSubtitle {
            return Text(recipe.subtitle)
        } else {
            return nil
        }
    }

    private var leading: ODSListItem.Leading? {
        let emptyImage = Image("ods_empty", bundle: Bundle.ods)
        switch model.leadingOption {
        case .none:
            return nil
        case .icon:
            return .icon(Image(recipe.iconName))
        case .circle:
            return .circularImage(source: .asyncImage(recipe.url, emptyImage))
        case .square:
            return .squareImage(source: .asyncImage(recipe.url, emptyImage))
        case .wide:
            return .wideImage(source: .asyncImage(recipe.url, emptyImage))
        }
    }
    
    // =====================
    // MARK: Buttons actions
    // =====================
    
    // Info button action
    private func iButtonAction() {
        showAlert = true
    }
}