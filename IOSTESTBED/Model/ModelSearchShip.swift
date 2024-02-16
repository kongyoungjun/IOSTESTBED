import Foundation
import SwiftUI
import CoreLocation

struct ModelSearchShip : Decodable {
    
    public let SHIPNO: String // 호선번호 1
    public let PROJNO: String // 공사번호 2
    public let JPTYPE: String? // 엔진타입 3
    public let TESTST: String? // 공시일자 4
    public let SHYARDNM: String? //조선소 5
    public let ASSYST: String? // 배딩일자 6
    public let TBED: String? // 배드 7
    public let ASSYDEPT: String? // 조립부서 8
    public let OOWNERNM: String? // 선주 9
    public let SNATIONNM: String? // 국적 10
    public let TYPE1: String? // 타입1 11
    public let TYPE2: String? // 타입2 12
    public let TYPE3: String? // 타입3 13
    public let TYPE4: String? // 타입4 14
    public let DELDATE: String? // 납기일 15
    public let FNDATE: String? // 완료일 16
    public let QTY1: String? // 수량 17
    public let BHP: String? // 정격출력 18
    public let RPM: String? // 회전수 19
    public var GRADE: String?// 등급 20
    public var SUBPROJNO: String?// 등급 21
    
    //public let CHGPROJNO: String?
//    public let DOCK: String
//    public let SHORTGB: String
//    public let MPCODE: String
//    public let REMARK: String
//    public let DOCKNO: String
//    public let SUBPROJNO: String
//    public let OUTDATE: String
//    public let TCTYPE3: String
//    public let TCTYPE4: String
//    public let TCTYPE1: String
//    public let SCRPROJ: String
//    public let MPROJ: String
//    public let SHYCDNM: String
//    public let EYSYEAR: String
//    public let MCR: String
//    public let TESTACT: String
//    public let NATIONNM: String
//    public let SHYCD: String
//    public let ASSYCD: String
//    public let RPM1: String
//    public let TIER: String
//    public let CANCL: String
//    public let PSTATUS: String
//    public let EYSBG: String
//    public let TCTYPEGR: String
//    public let NSHYGRNM: String
//    public let QTY: String
//    public let NSHYGR: String
//    public let TCASSYST: String
//    public let SHORTRATE: String
//    public let SHYARDNM: String
//    public let DELPLAN: String
//    public let TCASSYFN: String
//    public let TYPEGR: String
//    public let CRTCLS: String
//    public let EOBNAME: String
//    public let BHP1: String
//    public let LECODE: String
}
