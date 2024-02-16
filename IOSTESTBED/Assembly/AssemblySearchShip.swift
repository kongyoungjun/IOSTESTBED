//
//  AssemblySearchShip.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/07.
//

import SwiftUI

struct AssemblySearchShip: View {
    @StateObject var userData = UserData(loginIDNew: "")
    
    @State private var modelships: [ModelSearchShip] = []
    @State private var selectedship: ModelSearchShip?

    
    @State private var showAlert = false
    
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
    
    @State var state: Int  = 0;
    @Binding var isPresented: Bool
    
    @State private var isBigEngine: Bool = true
    @State private var isLoading: Bool = false
    
    @State private var selectedFromDate = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
    @State private var selectedToDate = Calendar.current.date(byAdding: .month, value: 11, to: Date()) ?? Date()
    
    
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
            
            Text(" 호선정보조회").font(.pretendardBold24)
            
            Divider()
            
        
            HStack
            {
                VStack(alignment:.leading,  spacing: 3)
                {
                    HStack{
                           Text(" 구분:").font(.pretendardBold14)
                           Spacer()
                           Button(action: {
                               isBigEngine = true
                           }) {
                               Text("대형").font(.pretendardBold18)
                                   .frame(width: 40, height: 10)
                                   .padding()
                                   .foregroundColor(.white)
                                   .background(isBigEngine ? Color.blue : Color.gray)
                           }
                            Button(action: {
                                isBigEngine = false
                            }) {
                                Text("힘센").font(.pretendardBold18)
                                    .frame(width: 40, height: 10)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(isBigEngine ? Color.gray : Color.blue)
                            }
                          Spacer()
                          Spacer()
                          Spacer()
                          Spacer()
                        
    
                    }
                    
                    HStack
                    {
                        Text(" 호선번호:").font(.pretendardBold14)
                        TextField("", text: $textShip)
                                        .font(.pretendardBold14)
                                        .autocapitalization(.allCharacters)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            isShowingPopup1 = true
                        }) {
                            Image("iconsearch")
                                .padding(6)
                                .background(Color.blue)
                        }
                        .sheet(isPresented: $isShowingPopup1, content: {
                            PopUpShipNo(isPresented: $isShowingPopup1, state: $state , textInput: $textShip)
                                    })
//                        .sheet(isPresented: $isShowingPopup, content: {
//                                PopUpProjNo(isPresented: $isShowingPopup)})
                    }
                    HStack
                    {
                        Text(" 공사번호:").font(.pretendardBold14)
                        
                        TextField("", text: $textProjno)
                                        .font(.pretendardBold14).autocapitalization(.allCharacters)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            isShowingPopup2 = true
                        }) {
                            Image("iconsearch")
                                .padding(6)
                                .background(Color.blue)
                        }
                        .sheet(isPresented: $isShowingPopup2, content: {
                            PopUpProjNo(isPresented: $isShowingPopup2, state: $state , textInput: $textProjno)
                                    })
                      //  .sheet(isPresented: $isShowingPopup, content: {
                              //  PopUpProjNo(isPresented: $isShowingPopup)})
                    }
                    
                    
                     
                    
                }
                Spacer()
                HStack
                {
                        Button(action: {
                            var textReult : String = loadData(mode : isBigEngine, from: textShip, to: textProjno)
                        }) {
                            Text("조회").font(.pretendardBold24)
                                .frame(height: 100)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                Spacer()
            }
            
            HStack (spacing: 0)
            {
                Text(" 공시일  : ").font(.pretendardBold14)
                DatePicker("Select Date", selection: $selectedFromDate, displayedComponents: .date).labelsHidden().font(.pretendardBold12)
                Text(" ~ ").font(.pretendardBold14)
               DatePicker("Select Date", selection: $selectedToDate, displayedComponents: .date).labelsHidden().font(.pretendardBold12)
               Spacer()
                              
            }
            
            Spacer()
            
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack{
                    HStack (alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Button(action: {}) { Text("호선번호")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("공사번호")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("타입")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("공시일")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Spacer(minLength: 1)

                    }
                  
                }
                
            }.frame(width: .infinity, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            NavigationView {
                        VStack {
                            if isLoading {
                                                ProgressView("Loading...")
                                                    .progressViewStyle(CircularProgressViewStyle())
                                                    .padding()
                            } else {
                                List(modelships, id: \.PROJNO)
                                {
                                    modelship in
                                    HStack(alignment: .top) {
                                        let nullString = "N/A"
                                       // let grade = modelship.GRADE ?? nullString
                                       // let jptype = modelship.JPTYPE ?? nullString
                                        
                                        Text("\(modelship.SHIPNO)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 100, minHeight: 10, maxHeight: 30 , alignment: .center)
                                            .onTapGesture{
                                                findDetails(select : modelship)
                                            }
                                        Text("\(modelship.PROJNO)").font(.pretendardBold12).frame(minWidth:0, maxWidth: 100, minHeight: 10, maxHeight: 30, alignment: .center)
                                            .onTapGesture{
                                                findDetails(select : modelship)
                                            }
                                        Text("\(modelship.JPTYPE ?? nullString)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 100, minHeight: 10, maxHeight: 30, alignment: .center)
                                            .onTapGesture{
                                                findDetails(select : modelship)
                                            }
                                        
                                        Text("\(modelship.TESTST ?? nullString)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 100, minHeight: 10, maxHeight: 30, alignment: .center)
                                            .onTapGesture{
                                                findDetails(select : modelship)
                                            }
                                    }
                                    
                                    
                                }
                                .listStyle(.grouped)
                            }
                        }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .automatic).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack(spacing: 1)
                {
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("호선번호").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult1).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("공사번호").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult2).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("엔진타입").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult3).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("공시일자").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult4).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("조선소").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult5).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("배딩일자").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult6).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("BED").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult7).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("조립부서").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult8).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("선주").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult9).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("국적").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult10).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                }
            }
            .frame(width: .infinity, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
      
    }
    
    private func findDetails(select searchShip : ModelSearchShip)
    {
        let nullString = "N/A"
        textResult1 = searchShip.SHIPNO
        textResult2 = searchShip.PROJNO
        textResult3 = searchShip.JPTYPE ?? nullString
        textResult4 = searchShip.TESTST ?? nullString
        textResult5 = searchShip.SHYARDNM ?? nullString
        textResult6 = searchShip.ASSYST ?? nullString
        textResult7 = searchShip.TBED ?? nullString
        textResult8 = searchShip.ASSYDEPT ?? nullString
        textResult9 = searchShip.OOWNERNM ?? nullString
        textResult10 = searchShip.SNATIONNM ?? nullString
    }
    
    private func dateToString(_ date: Date, format: String) -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = format
          return dateFormatter.string(from: date)
      }
    
    func addMonthsToDate(_ date: Date, months: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: months, to: date)
    }
    
    private func clearData() {
        modelships.removeAll()
    }
    private func loadData(mode bBigEngine: Bool, from textShipNo: String, to textProjNo : String )-> String {
        isLoading = true
        
        var textMode = String()
        if bBigEngine {
            textMode = "A"
        }
        else{
            textMode = "B"
        }
        
        
        guard let url = URL(string:
                                "https://m-engine.hhi.co.kr/mengine/testbed/searchship.jsp?user_id=\(userData.loginId)&gubun=\(textMode)&projno=\(textProjNo)&subprojno=&shipno=\(textShip)&stdate=\(dateToString(selectedFromDate, format: "yyyyMMdd"))&fndate=\(dateToString(selectedToDate, format: "yyyyMMdd"))"
        )
        else {
            return "ERROR"
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer {
                DispatchQueue.main.async {
                    isLoading = false
                }
            }
            
            guard let data = data, error == nil else {
                        return
                    }

            do {
                
                    let decodedData = try JSONDecoder().decode([String: [ModelSearchShip]].self, from: data)
                if let workership = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelships = workership
                                        }
                    }
                
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
        return "OK"
    }

    
}

struct AssemblySearchShip_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchShip(isPresented: Binding.constant(false))
    }
}
