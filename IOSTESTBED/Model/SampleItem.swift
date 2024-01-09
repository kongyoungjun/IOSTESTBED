import Foundation
import SwiftUI
import CoreLocation

struct SampleItem: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
}
