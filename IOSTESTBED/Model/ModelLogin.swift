import Foundation
import SwiftUI
import CoreLocation

struct ModelLogin: Codable {
    var list : [ResultType]
}

struct ResultType: Codable {
    var result : Int
    var DWGFLAG : String?
    var USERNM_KOR : String?
    
    
}


//struct ModelLogin: Decodable {
//   public let RESULT: String
//    public let RESULT1: String
//}
