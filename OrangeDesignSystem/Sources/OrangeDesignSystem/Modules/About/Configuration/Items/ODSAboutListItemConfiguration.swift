//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import SwiftUI

/// Priority of item in the list.
/// The hightest means that the item is placed at the top of the list.
/// The lowest means that the item is placed at the end (bottom) of the list.
///
/// @Remarks: pricacyPolicy, termsOfService and accessibility statement must be grouped, so their priority are fixed.
/// However, it is possible to add items before or after these elements using higher or lower priority.
/// Priorities are also defined for app news, legal information, more apps and rate the app items, but it is possible to use another priority in the associated item initializer.
public typealias ODSAboutListItemPriority = Int

/// Default priorities to order items in list
extension ODSAboutListItemPriority {
    public static let hightest = Int.max
    public static let lowest = Int.min

    /// Fixed positions of mandatory items
    public static let privacyPolicy = 102
    public static let termOfService = 101
    public static let accessibilityStatement = 100

    /// Positions of proposed items
    public static let appNews = 60
    public static let legalInformation = 50
    public static let moreApps = 40
    public static let rateTheApp = 30
}

/// Define the target of the list item.
public enum ODSAboutListItemTarget {
    /// Means the items is a navigation link that opens the provided view.
    case destination(AnyView)
    /// Means the item is like a button that runs action when it is tapped.
    case action(() -> Void)
}

/// Use this protocol to define a custom list item with a dedicated configuration.
/// Have a look on __ODSAboutAppNewsItemConfig__ to see an example of implementation.
public protocol ODSAboutListItemConfig {

    var title: String { get }
    var icon: Image { get }
    var target: ODSAboutListItemTarget { get }
    var priority: ODSAboutListItemPriority { get }
}
