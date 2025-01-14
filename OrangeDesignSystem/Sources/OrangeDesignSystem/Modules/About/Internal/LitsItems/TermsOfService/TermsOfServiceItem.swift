//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import SwiftUI

struct AboutTermOfServiceItem: ODSAboutListItemConfig {

    // =======================
    // MARK: Stored Properties
    // =======================

    let title: String
    let icon: Image
    let target: ODSAboutListItemTarget
    let priority: ODSAboutListItemPriority

    init<TermsOfService>(@ViewBuilder termsOfService: () -> TermsOfService) where TermsOfService: View {
        title = °°"modules.about.terms_of_service.title"
        icon = Image("ic_calendarEventInfo", bundle: Bundle.ods)
        priority = ODSAboutListItemPriority.termOfService
        target = .destination(AnyView(termsOfService()))
    }
}
