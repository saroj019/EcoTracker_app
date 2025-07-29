import SwiftUI
struct WeatherSection: View {
    let temperature: Double
    let humidity: Int
    let windSpeed: Double
    let distanceWalked: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Today's Weather & Activity")
                .font(.title2)
                .bold()
                .padding(.bottom, 5)

            HStack(spacing: 30) {
                WeatherItem(icon: "thermometer", label: "Temp", value: String(format: "%.1f°C", temperature))
                WeatherItem(icon: "humidity", label: "Humidity", value: "\(humidity)%")
                WeatherItem(icon: "wind", label: "Wind", value: String(format: "%.1f km/h", windSpeed))
                WeatherItem(icon: "figure.walk", label: "Walked", value: String(format: "%.1f km", distanceWalked))
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(20)
        .shadow(radius: 8)
    }
}

struct WeatherItem: View {
    let icon: String
    let label: String
    let value: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.green)
            Text(label)
                .font(.caption)
            Text(value)
                .font(.headline)
                .foregroundColor(.green)
        }
    }
}
