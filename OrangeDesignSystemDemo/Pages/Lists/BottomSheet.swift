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

// MARK: Button sheet with header and content
struct BottomSheet: View {
    @State var showContent: Bool = true

    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            VStack(spacing: 0) {
                BottomSheedHeader(showContent: $showContent)
                    .background(Color(.systemGray6))

                if showContent {
                    BottomSheetContent()
                }
            }
            .background(Color(UIColor.systemBackground))
        }
        .cornerRadius(10)
        .shadow(radius: 8)
    }
}

struct BottomSheedHeader: View {

    @Binding var showContent: Bool

    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 55, height: 4, alignment: .center)
                .padding(.top, 8)
                .padding(.bottom, 4)

            Button {
                showContent.toggle()
            } label: {
                VStack(spacing: 0) {
                    HStack(spacing: 16) {
                        let imageName = showContent ? "chevron.down" : "chevron.up"

                        Image(systemName: imageName)
                            .foregroundColor(.primary)
                            .accessibility(hidden: true)

                        Text("Settings")
                            .odsFont(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding(.all, 8)

                    Divider()
                }
            }
        }
    }
}

// MARK: Bottom Sheet - content for list
struct BottomSheetContent: View {

    @EnvironmentObject var listPageModel: ListPageModel

    var body: some View {
        VStack(spacing: 16) {
            ODSChipPicker(title: "Second line of text",
                          selection: $listPageModel.selectedSecondLineOfTextChip,
                          allowZeroSelection: true,
                          chips: listPageModel.secondLineOfTextChips)

            ODSChipPicker(title: "Leading",
                          selection: $listPageModel.selectedLeadingImageChip,
                          allowZeroSelection: true,
                          chips: listPageModel.leadingImageChips)

            ODSChipPicker(title: "Trailing",
                          selection: $listPageModel.selectedTrailingImageChip,
                          allowZeroSelection: true,
                          chips: listPageModel.trailingImageChips)
        }
        .padding(.vertical, 8)
    }
}
