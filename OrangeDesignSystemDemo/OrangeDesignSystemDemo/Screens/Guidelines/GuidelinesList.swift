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
            SpacingsGuideline(),
            TypographyGuideline()
        ]
    }
    
    // ==========
    // MARK: Body
    // ==========
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: ODSSpacing.xs) {
                    ForEach(guidelines, id: \.title) { guideline in
                        NavigationLink {
                            GuidelinePage(guideline: guideline)
                        } label: {
                            ODSCardVerticalImageFirst(
                                title: Text(guideline.title),
                                imageSource: .image(imageFrom(resourceName: guideline.imageName)))
                        }
                    }
                }
                .padding(.all, ODSSpacing.m)
                .navigationTitle("Guidelines")
                .navigationbarMenuForThemeSelection()
            }
            
            GuidelinePage(guideline: guidelines[0]) // Why ?
        }
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