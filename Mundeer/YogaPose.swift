import Foundation
import SwiftUI

struct YogaPose: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let benefits: String
    let difficulty: String
    let duration: String
    let instructions: String
}
