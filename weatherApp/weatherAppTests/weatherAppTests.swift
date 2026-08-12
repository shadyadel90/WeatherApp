//
//  weatherAppTests.swift
//  weatherAppTests
//
//  Created by Shady Adel on 28/08/2024.
//

import XCTest
@testable import weatherApp

final class weatherAppTests: XCTestCase {

    func testNetwork_Success() throws {
        guard ProcessInfo.processInfo.environment["WEATHER_API_KEY"]?.isEmpty == false else {
            throw XCTSkip("Set WEATHER_API_KEY in the test scheme to run the live API integration test.")
        }

        let expectation = expectation(description: "Waiting for successful fetch")

        NetworkService.fetchData(Constants.ApiUrl) { weather, error in
            XCTAssertNil(error, "Expected no error, but got \(String(describing: error))")
            XCTAssertNotNil(weather, "Expected weather data, but got nil")
            XCTAssertEqual(weather?.location.name, "Cairo", "Expected location name to be 'Cairo'")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }

    func testNetwork_ErrorHandling() {
        let expectation = expectation(description: "Waiting for error handling")
        let invalidAPIKey = "invalid_key"
        let api = "https://api.weatherapi.com/v1/forecast.json?key=\(invalidAPIKey)&q=30.0444,31.2357&days=3&aqi=no&alerts=no"

        NetworkService.fetchData(api) { weather, error in
            XCTAssertNotNil(error, "Expected error, but got nil")
            XCTAssertNil(weather, "Expected no weather data, but got \(String(describing: weather))")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5)
    }
}
