//
//  AssemblySearchShipPic.swift
//  IOSTESTBED
//
//  Created by  hhi on 2/2/24.
//

import SwiftUI

struct AssemblySearchShipPic: View {
    //@ObservedObject var userDataSearchShip = UserData()
    @State private var shippic1s: [ModelSearchShipPic1] = []
    @State private var selectedshippic1: ModelSearchShipPic1?
    
    
    @State private var shippic2s: [ModelSearchShipPic2] = []
    @State public var selectedshippic2: ModelSearchShipPic2?
    
    @State private var showAlert = false
    @State private var showAlert_change = false

    
    @State private var isDataLoaded = false
    @State private var isShowingPopup1 = false
    @State private var isShowingPopup2 = false
    @State private var isShowingPopup3 = false
    @State private var textShip: String = ""
    @State private var textProjno: String = ""
    @State  var textSelectProjno: String = ""
    @State  var textSelectSubProjno: String = ""
    
    
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
    
    //@State private var isBigEngine: Bool = true
    @State private var isLoadingUp: Bool = false
    @State private var isLoadingDown: Bool = false
    
    @State private var selectedFromDate = Calendar.current.date(byAdding: .month, value: -1, to: Date()) ?? Date()
    @State private var selectedToDate = Calendar.current.date(byAdding: .month, value: 1, to: Date()) ?? Date()
    
    
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
            
            Text(" 호선담당자관리").font(.pretendardBold24)
            
            Divider()
            
            
            HStack
            {
                VStack(alignment:.leading,  spacing: 3)
                {
                    HStack
                    {
                        Text(" 호선번호:").font(.pretendardBold14)
                        TextField("호선번호", text: $textShip)
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
                    }
                    HStack
                    {
                        Text(" 공사번호:").font(.pretendardBold14)
                        
                        TextField("공사번호", text: $textProjno)
                            .font(.pretendardBold14)
                            .autocapitalization(.allCharacters)
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
                    }
                    
                    
                    
                    
                }
                Spacer()
                HStack
                {
                    Button(action: {
                        var textReult : String = loadDataUp(from: textShip, to: textProjno)
                    }) {
                        Text("조회").font(.pretendardBold24)
                            .frame(height: 50)
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
                        Button(action: {}) { Text("공사번호")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth: (hstackwidth * 0.20), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("호선번호")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth:  (hstackwidth * 0.20), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("엔진타입")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("공시일")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("호선담당자")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("품질담당자")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Spacer(minLength: 1)
                        
                    }
                    
                }
                
            }.frame(width: .infinity, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            NavigationView {
                VStack {
                    if isLoadingUp {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                    } else {
                        List(shippic1s, id: \.PROJNO) { shippic1 in
                            HStack(alignment: .top) {
                                let nullString = ""
                                let teststdateString = shippic1.TESTST ?? nullString
                                let teststprefixString = teststdateString.prefix(10)
                                Text("\(shippic1.PROJNO)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 90, minHeight: 10, maxHeight: 30 , alignment: .center)
                                Text("\(shippic1.SHIPNO ?? nullString)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 75, minHeight: 10, maxHeight: 30, alignment: .center)
                                Text("\(shippic1.JPTYPE ?? nullString)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 45, minHeight: 10, maxHeight: 30, alignment: .center)
                                Text("\(teststprefixString)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 75, minHeight: 10, maxHeight: 30, alignment: .center)
                                Text("\(shippic1.EMPNM1 ?? nullString)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 35, minHeight: 10, maxHeight: 30, alignment: .center)
                                Text("\(shippic1.EMPNM2 ?? nullString)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 35, minHeight: 10, maxHeight: 30, alignment: .center)
                            }
                                    .onTapGesture {
                                        //selectedshippic1 = shippic1
                                        var textReult : String = loadDataDown(from : shippic1.PROJNO)
                                    }
                                
                            }
                            .listStyle(.grouped)
                        }
                    }
                }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .automatic)
                
//                HStack(alignment:.center, spacing: 1)
//                {
//                    Spacer()
//                    VStack(alignment:.trailing, spacing: 1)
//                    {
//                        Button(action: {
//                            isShowingPopup3 = true
//                        }) {
//                            Text("상세").font(.pretendardBold18)
//                                .frame(width:100, height: 30)
//                                .foregroundColor(.white)
//                                .background(Color.blue)
//                        }
//                        .sheet(isPresented: $isShowingPopup3, content: {
//                            AssemblySearchShipPicDetail(isPresented: $isShowingPopup3)
//                        }
//                        )
//                    }
//                }
                GeometryReader { geometry in
                    let hstackwidth = geometry.size.width
                    VStack{
                        HStack (alignment:.center, spacing: 1)
                        {
                            Spacer(minLength: 1)
                            Button(action: {}) { Text("기능")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth: (hstackwidth * 0.10), minHeight: 10, maxHeight: 30).background(Color.gray)
                            Button(action: {}) { Text("설계")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                            Button(action: {}) { Text("호선담당자")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth:  (hstackwidth * 0.20), minHeight: 10, maxHeight: 30).background(Color.gray)
                            Button(action: {}) { Text("사무실")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth:  (hstackwidth * 0.20), minHeight: 10, maxHeight: 30).background(Color.gray)
                            Button(action: {}) { Text("전화번호")}.foregroundColor(.white).font(.pretendardBold12).frame(minWidth:0, maxWidth:  (hstackwidth * 0.35), minHeight: 10, maxHeight: 30).background(Color.gray)
                            Spacer(minLength: 1)
                            
                        }
                        
                    }
                    
                }.frame(width: .infinity, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                NavigationView {
                    VStack {
                        if isLoadingDown {
                                            ProgressView("Loading...")
                                                .progressViewStyle(CircularProgressViewStyle())
                                                .padding()
                        } else {
                            List(shippic2s, id: \.SECTNO) { shippic2 in
                                HStack(alignment: .top) {
                                    let nullString = ""
                                    Text("\(shippic2.SECTNO)").font(.pretendardBold10)
                                        .frame(minWidth:0, maxWidth: 30, minHeight: 10, maxHeight: 30 , alignment: .center)
                                    Text("\(shippic2.SECTNO_NM ?? nullString)").font(.pretendardBold10)
                                        .frame(minWidth:0, maxWidth: 40, minHeight: 10, maxHeight: 30, alignment: .center)
                                    Text("\(shippic2.NAME ?? nullString)").font(.pretendardBold10)
                                        .frame(minWidth:0, maxWidth: 70, minHeight: 10, maxHeight: 30, alignment: .center)
                                    Text("\(shippic2.TELNO ?? nullString)").font(.pretendardBold10)
                                        .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30, alignment: .center)
                                        .onTapGesture{
                                            if let phoneURL = URL(string: "tel://\(shippic2.TELNO ?? nullString)") {
                                                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)}
                                        }
                                    Text("\(shippic2.HPNO ?? nullString)").font(.pretendardBold10)
                                        .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30, alignment: .center)
                                        .onTapGesture{
                                            if let phoneURL = URL(string: "tel://\(shippic2.HPNO ?? nullString)") {
                                                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)}
                                        }
                                }
                               // .onTapGesture {
                                  //  selectedshippic2 = shippic2
                                  //  textSampel = selectedWorker!.EMPNO
                               // }

                            }
                            .listStyle(.grouped)
                        }
                        
                        
                    }.navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
                }
        }
    }
    private func dateToString(_ date: Date, format: String) -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = format
          return dateFormatter.string(from: date)
    }
    func addMonthsToDate(_ date: Date, months: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: months, to: date)
    }
    
    func loadDataUp(from textShipNo: String, to textProjNo : String )-> String {
        isLoadingUp = true
        
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/searchshippic1.jsp?gubun=A&projno=\(textProjNo)&shipno=\(textShipNo)&stdate=\(dateToString(selectedFromDate, format: "yyyyMMdd"))&fndate=\(dateToString(selectedToDate, format: "yyyyMMdd"))&id=")
        else {
            return "ERROR"
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer {
                DispatchQueue.main.async {
                    isLoadingUp = false
                }
            }
            
            guard let data = data, error == nil else {
                        return
                    }

            do {
                
                    let decodedData = try JSONDecoder().decode([String: [ModelSearchShipPic1]].self, from: data)
                                    if let ShipPicList1 = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            shippic1s = ShipPicList1
                                        }
                    }
                
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
        return "OK"
    }
    
    private func loadDataDown(from textProjNo : String )-> String {
        isLoadingDown = true
        
        
        guard let url = URL(string:
                            "https://m-engine.hhi.co.kr/mengine/testbed/searchshippic2.jsp?gubun=A&projno=\(textProjNo)&id=")
        else {
            return "ERROR"
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer {
                DispatchQueue.main.async {
                    isLoadingDown = false
                }
            }
            
            guard let data = data, error == nil else {
                        return
                    }

            do {
                
                    let decodedData = try JSONDecoder().decode([String: [ModelSearchShipPic2]].self, from: data)
                                    if let ShipPicList2 = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            shippic2s = ShipPicList2
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

struct AssemblySearchShipPic_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchShipPic(isPresented: Binding.constant(false))
    }
}

