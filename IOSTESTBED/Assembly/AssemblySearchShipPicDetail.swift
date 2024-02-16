//
//  AssemblySearchShipPicDetail.swift
//  IOSTESTBED
//
//  Created by  hhi on 2/2/24.
//

import SwiftUI

struct AssemblySearchShipPicDetail: View {
    
    @Binding  var isPresented: Bool
  //  @Binding  var shippic1detail: ModelSearchShipPic1
    
//    @State private var modelworkers: [ModelWorker] = []
//    @State private var selectedWorker: ModelWorker?

    
    @State private var isDataLoaded = false
    @State private var isShowingPopup1 = false
    @State private var isShowingPopup2 = false
    @State private var textShip: String = ""
    @State private var textProjno: String = ""
    
    
    @State private var textResult1: String = ""
    @State private var textResult2: String = ""
    @State private var textResult3: String = ""
    @State private var textResult4: String = ""
    @State private var textResult5: String = ""
    @State private var textResult6: String = ""
    @State private var textResult7: String = ""
    @State private var textResult8: String = ""
    @State private var textResult9: String = ""
    @State private var textResult10: String = ""
    @State private var textResult11: String = ""
    @State private var textResult12: String = ""
    @State private var textResult13: String = ""
    @State private var textResult14: String = ""
    @State private var textResult15: String = ""
    @State private var textResult16: String = ""
    
    @State var state: Int  = 0;
    
    @State private var isBigEngine: Bool = true
    @State private var isLoading: Bool = false
    
    @State private var selectedFromDate = Date()
    @State private var selectedToDate = Date()
    
    
    let colorwhiteblue = Color(red: 243/255, green: 248/255, blue: 255/255)
    let colordarkblue = Color(red: 0/255, green: 23/255, blue: 51/255)
    
    
    var body: some View {
        VStack (alignment:.leading,  spacing: 3)
        {
            Button(action: {
                isPresented = false
            }) {
                Text("< Back").frame(height: 10)
            }
            Spacer()
            
            Text(" 호선정보상세").font(.pretendardBold24)
            
            Divider()
            
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack(spacing: 1)
                {
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("호선번호").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult1).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Text("공사번호").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult2).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("엔진타입").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult3).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Text("공시일자").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult4).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("호선담당자").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult5).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Text("품질담당자").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult6).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("조립부서").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult7).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Text("베딩일자").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult8).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("TYPE1").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult9).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Text("TYPE2").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult10).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("TYPE3").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult11).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Text("TYPE4").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult12).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("프로젝트구분").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult13).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Text("정격출력").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult14).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("BED").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult15).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Text("납기일자").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 80).background(colorwhiteblue)
                        TextField("", text: $textResult16).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 80).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                }
            }
            .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
      
    }
    

}


struct AssemblySearchShipPicDetail_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchShipPicDetail(isPresented: Binding.constant(false))
    }
}
