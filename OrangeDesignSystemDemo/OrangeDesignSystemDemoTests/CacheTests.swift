//
// Software Name: Orange Design System (iOS)
// SPDX-FileCopyrightText: Copyright (c) 2021 - 2023 Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license.
//

@testable import OrangeDesignSystem
import XCTest

class CacheTests: XCTestCase {

    func testSetValueSucceeds_dateFormatter_localeDateTimeConfiguration() {
        // Given
        let (key1, value1) = firstKeyValuePairForLocaleDateTimeConfiguration()
        let (key2, value2) = secondKeyValuePairForLocaleDateTimeConfiguration()
        let cache = Cache<DateFormatterCache.LocaleDateTimeConfiguration, DateFormatter>()

        // When
        cache[key1] = value1
        cache.setValue(value2, forKey: key2)

        // Then
        XCTAssertEqual(value1, cache[key1])
        XCTAssertEqual(value1, cache.value(forKey: key1))
        XCTAssertEqual(value2, cache[key2])
        XCTAssertEqual(value2, cache.value(forKey: key2))
    }

    func testSetValueSucceeds_dateFormatter_dateFormatConfiguration() {
        // Given
        let (key1, value1) = firstKeyValuePairForDateFormatConfiguration()
        let (key2, value2) = secondKeyValuePairForDateFormatConfiguration()
        let cache = Cache<DateFormatterCache.DateFormatConfiguration, DateFormatter>()

        // When
        cache[key1] = value1
        cache.setValue(value2, forKey: key2)

        // Then
        XCTAssertEqual(value1, cache[key1])
        XCTAssertEqual(value1, cache.value(forKey: key1))
        XCTAssertEqual(value2, cache[key2])
        XCTAssertEqual(value2, cache.value(forKey: key2))
    }

    func testRemoveValueSucceeds_dateFormatter_localeDateTimeConfiguration() {
        // Given
        let (key1, value1) = firstKeyValuePairForLocaleDateTimeConfiguration()
        let (key2, value2) = secondKeyValuePairForLocaleDateTimeConfiguration()
        let cache = Cache<DateFormatterCache.LocaleDateTimeConfiguration, DateFormatter>()
        cache[key1] = value1
        cache[key2] = value2

        // When
        cache[key1] = nil
        cache.removeValue(forKey: key2)

        // Then
        XCTAssertNil(cache[key1])
        XCTAssertNil(cache[key2])
    }

    func testRemoveValueSucceeds_dateFormatter_dateFormatConfiguration() {
        // Given
        let (key1, value1) = firstKeyValuePairForDateFormatConfiguration()
        let (key2, value2) = secondKeyValuePairForDateFormatConfiguration()
        let cache = Cache<DateFormatterCache.DateFormatConfiguration, DateFormatter>()
        cache[key1] = value1
        cache[key2] = value2

        // When
        cache[key1] = nil
        cache.removeValue(forKey: key2)

        // Then
        XCTAssertNil(cache[key1])
        XCTAssertNil(cache[key2])
    }

    func testRemoveAllValuesSucceeds_dateFormatter_localeDateTimeConfiguration() {
        // Given
        let (key1, value1) = firstKeyValuePairForLocaleDateTimeConfiguration()
        let (key2, value2) = secondKeyValuePairForLocaleDateTimeConfiguration()
        let cache = Cache<DateFormatterCache.LocaleDateTimeConfiguration, DateFormatter>()
        cache[key1] = value1
        cache[key2] = value2

        // When
        cache.removeAllValues()

        // Then
        XCTAssertNil(cache[key1])
        XCTAssertNil(cache[key2])
    }

    func testRemoveAllValuesSucceeds_dateFormatter_dateFormatConfiguration() {
        // Given
        let (key1, value1) = firstKeyValuePairForDateFormatConfiguration()
        let (key2, value2) = secondKeyValuePairForDateFormatConfiguration()
        let cache = Cache<DateFormatterCache.DateFormatConfiguration, DateFormatter>()
        cache[key1] = value1
        cache[key2] = value2

        // When
        cache.removeAllValues()

        // Then
        XCTAssertNil(cache[key1])
        XCTAssertNil(cache[key2])
    }

    // ===============
    // MARK: - Helpers
    // ===============

    private func firstKeyValuePairForLocaleDateTimeConfiguration() -> (DateFormatterCache.LocaleDateTimeConfiguration, DateFormatter) {
        let locale = Locale(identifier: "fr")
        let dateStyle = DateFormatter.Style.short
        let timeStyle = DateFormatter.Style.none

        let key = DateFormatterCache.LocaleDateTimeConfiguration(locale: locale, dateStyle: dateStyle, timeStyle: timeStyle)
        let value = DateFormatter.formatter(for: locale, dateStyle: dateStyle, timeStyle: timeStyle)

        return (key, value)
    }

    private func secondKeyValuePairForLocaleDateTimeConfiguration() -> (DateFormatterCache.LocaleDateTimeConfiguration, DateFormatter) {
        let locale = Locale(identifier: "pl")
        let dateStyle = DateFormatter.Style.medium
        let timeStyle = DateFormatter.Style.full

        let key = DateFormatterCache.LocaleDateTimeConfiguration(locale: locale, dateStyle: dateStyle, timeStyle: timeStyle)
        let value = DateFormatter.formatter(for: locale, dateStyle: dateStyle, timeStyle: timeStyle)

        return (key, value)
    }

    private func firstKeyValuePairForDateFormatConfiguration() -> (DateFormatterCache.DateFormatConfiguration, DateFormatter) {
        let dateFormat = "yyyy-MM-dd"

        let key = DateFormatterCache.DateFormatConfiguration(dateFormat: dateFormat)
        let value = DateFormatter.formatter(for: dateFormat)

        return (key, value)
    }

    private func secondKeyValuePairForDateFormatConfiguration() -> (DateFormatterCache.DateFormatConfiguration, DateFormatter) {
        let dateFormat = "dd-mm-yy"

        let key = DateFormatterCache.DateFormatConfiguration(dateFormat: dateFormat)
        let value = DateFormatter.formatter(for: dateFormat)

        return (key, value)
    }
}
