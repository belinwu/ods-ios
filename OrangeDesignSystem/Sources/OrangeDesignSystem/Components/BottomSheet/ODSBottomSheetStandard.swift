//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import SwiftUI

extension View {

    ///
    /// <a href="https://system.design.orange.com/0c1af118d/p/3347ca-sheets-bottom/b/83b619" target="_blank">ODS Sheet Bottom</a>.
    ///
    /// Bottom sheets are surfaces anchored to the bottom of the screen that present users supplemental content.
    /// It is useful for requesting a specific information or enabling a simple task related to the current context
    /// of the current view or more globaly the application context.
    ///
    /// The standard bottom sheet must be used only with a "simple, basic" content. If a more complex content must be added
    /// prefer the __ odsBottomSheetExpanding__ modifiers.
    ///
    ///
    /// This modifier adds a bottom sheet containing only title in header. It opens the sheet
    /// when a binding to a Boolean value that you provide is true.
    ///
    /// The example below shows how to present a bottom sheet:
    ///
    ///    struct BottomSheetPresentation: View {
    ///        @State private var isOpen = false
    ///
    ///        var body: some View {
    ///            VStack {
    ///                //  Main content goes here.
    ///                Text("Bottom sheet is \(isOpen ? "Opened": "Closed")")
    ///            }
    ///            .odsBottomSheetStandard(isOpen: $isOpen, title: "Customize") {
    ///                // Bottom sheet content goes here
    ///            }
    ///        }
    ///    }
    ///
    /// - Parameters:
    ///   - isOpen: A binding to a Boolean value that determines whether
    ///     to open the sheet that you create in the modifier's
    ///     `content` closure.
    ///   - title: The title added in the header.
    ///   - content: A closure that returns the content of the bottom sheet.
    ///
    public func odsBottomSheetStandard<Content: View>(
        isOpen: Binding<Bool>,
        title: String,
        @ViewBuilder content: @escaping () -> Content) -> some View
    {
        modifier(ODSBottomSheetStandardModifier(
            isOpen: isOpen,
            headerConfig: ODSBottomSheetStandardHeaderConfig(title: title),
            bottomSheetContent: content))
    }

    /// This modifier adds a bottom sheet containing title and subtitle in header.
    ///
    /// - Parameters:
    ///   - isOpen: A binding to a Boolean value that determines whether
    ///     to open the sheet that you create in the modifier's
    ///     `content` closure.
    ///   - title: The title added in the header.
    ///   - subtitle: Add a subtitle in header.
    ///   - content: A closure that returns the content of the bottom sheet.
    ///
    public func odsBottomSheetStandard<Content: View>(
        isOpen: Binding<Bool>,
        title: String,
        subtitle: String,
        @ViewBuilder content: @escaping () -> Content) -> some View
    {
        modifier(ODSBottomSheetStandardModifier(
            isOpen: isOpen,
            headerConfig: ODSBottomSheetStandardHeaderConfig(title: title, subtitle: subtitle),
            bottomSheetContent: content))
    }

    /// This modifier adds a bottom sheet containing title and icon in header.
    ///
    /// - Parameters:
    ///   - isOpen: A binding to a Boolean value that determines whether
    ///     to open the sheet that you create in the modifier's
    ///     `content` closure.
    ///   - title: The title added in the header.
    ///   - icon: Add a icon in header before title.
    ///   - animateIcon: To animate (ration to 180 degrees) when sheet is opening.
    ///   - content: A closure that returns the content of the bottom sheet.
    ///
    public func odsBottomSheetStandard<Content: View>(
        isOpen: Binding<Bool>,
        title: String,
        icon: Image,
        annimateIcon: Bool = true,
        @ViewBuilder content: @escaping () -> Content) -> some View
    {
        modifier(ODSBottomSheetStandardModifier(
            isOpen: isOpen,
            headerConfig: ODSBottomSheetStandardHeaderConfig(title: title, icon: icon, animateIcon: annimateIcon),
            bottomSheetContent: content))
    }
}
