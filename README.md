# WeatherApp

A SwiftUI weather application that fetches a 3-day forecast for Cairo and presents current conditions and forecast details using an MVVM-style structure.

## Highlights

- SwiftUI interface
- ViewModel-driven presentation logic
- URLSession networking
- WeatherAPI integration
- 3-day forecast and weather details
- XCTest coverage for networking behavior

## Structure

- `Model` — API models and app constants
- `Moduels/Main` — main weather screen and ViewModel
- `Moduels/Details` — detailed forecast UI
- `Networking` — URLSession-based network service
- `weatherAppTests` — networking tests

## API key setup

The repository does not contain an API key.

Create a WeatherAPI key, then add `WEATHER_API_KEY` as an environment variable in the Xcode scheme:

1. Open **Product → Scheme → Edit Scheme**.
2. Select **Run → Arguments**.
3. Under **Environment Variables**, add `WEATHER_API_KEY` with your local key.
4. Build and run the app.

Never commit API credentials to the repository.

## Tech

Swift, SwiftUI, MVVM, URLSession, XCTest
