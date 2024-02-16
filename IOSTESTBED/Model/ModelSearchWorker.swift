import Foundation
import SwiftUI
import CoreLocation

struct ModelSearchWorker: Decodable {
    public let EMPNO: String
    public let EMPNM: String
    public let STTIME: String?
    public let EDTIME: String?
    public let JOBTIME: String?
    public let UNJOBTM: String?
}
