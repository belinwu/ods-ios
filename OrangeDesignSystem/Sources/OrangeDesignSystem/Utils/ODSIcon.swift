//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

import SwiftUI

struct ODSIcon: View {

    // =======================
    // MARK: Stored Properties
    // =======================

    private let image: Image
    @ScaledMetric private var width: Double
    @ScaledMetric private var height: Double

    // ==================
    // MARK: Initializers
    // ==================
    // /!\ Set to 17 because the size of system font for body is 17
    init(_ image: Image, size: Double = 17) {
        self.init(image, width: size, height: size)
    }

    init(_ image: Image, width: Double, height: Double) {
        self.image = image
        _width = ScaledMetric(wrappedValue: width)
        _height = ScaledMetric(wrappedValue: height)
    }

    // ==========
    // MARK: Body
    // ==========

    var body: some View {
        image
            .resizable()
            .renderingMode(.template)
            .scaledToFill()
            .frame(width: width, height: height)
    }
}
