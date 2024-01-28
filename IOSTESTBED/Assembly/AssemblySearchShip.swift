//
//  AssemblySearchShip.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/07.
//

import SwiftUI

struct AssemblySearchShip: View {
    
    @State private var modelworkers: [ModelWorker] = []
    @State private var selectedWorker: ModelWorker?

    
    @State private var isDataLoaded = false
    @State private var isShowingPopup = false
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
                        TextField("호선번호", text: $textShip)
                                        .font(.pretendardBold14)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            isShowingPopup = true
                        }) {
                            Image("iconsearch")
                                .padding(6)
                                .background(Color.blue)
                        }
                        .sheet(isPresented: $isShowingPopup, content: {
                            PopUpShipNo(isPresented: $isShowingPopup, state: $state , textInput: $textShip)
                                    })
//                        .sheet(isPresented: $isShowingPopup, content: {
//                                PopUpProjNo(isPresented: $isShowingPopup)})
                    }
                    HStack
                    {
                        Text(" 공사번호:").font(.pretendardBold14)
                        
                        TextField("공사번호", text: $textProjno)
                                        .font(.pretendardBold14)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            isShowingPopup = true
                        }) {
                            Image("iconsearch")
                                .padding(6)
                                .background(Color.blue)
                        }
                        .sheet(isPresented: $isShowingPopup, content: {
                            PopUpShipNo(isPresented: $isShowingPopup, state: $state , textInput: $textShip)
                                    })
                      //  .sheet(isPresented: $isShowingPopup, content: {
                              //  PopUpProjNo(isPresented: $isShowingPopup)})
                    }
                    
                    
                     
                    
                }
                Spacer()
                HStack
                {
                        Button(action: {
                            loadData()
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
               DatePicker("Select Date", selection: $selectedFromDate, in: ...Date(), displayedComponents: .date).labelsHidden().font(.pretendardBold12)
                Text(" ~ ").font(.pretendardBold14)
               DatePicker("Select Date", selection: $selectedToDate, in: ...Date(), displayedComponents: .date).labelsHidden().font(.pretendardBold12)
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
                                List(modelworkers, id: \.EMPNO) { modelworkers in
                                    HStack(alignment: .top) {
                                        Text("\(modelworkers.EMPNO)")
                                        Text("\(modelworkers.DEPTNM)")
                                        Text("\(modelworkers.MOBILE)")
                                    }
                                    .onTapGesture {
                                        selectedWorker = modelworkers
                                      //  textSampel = selectedWorker!.EMPNO
                                    }
                                    
                                }
                            }
                            
                            
                        }.navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
            }
            
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack(spacing: 1)
                {
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("호선번호").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult1).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("공사번호").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult2).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("엔진타입").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult3).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("공시일자").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult4).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("조선소").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult5).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("배딩일자").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult6).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("BED").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult7).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("조립부서").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult8).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("선주").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult9).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("국적").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult10).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                }
            }
            .frame(width: .infinity, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
      
    }
    

    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: selectedFromDate)
    }
    
    private func clearData() {
        modelworkers.removeAll()
    }
    
    private func loadData() {
        //print("nav")
        isLoading = true
        
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/searchworker.jsp?userid=A372897&deptcd=KX6&empnm=") else {
            //print("nav1")
            return
        }
        //print("Error decoding JSON")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer {
                DispatchQueue.main.async {
                    isLoading = false
                }
            }
            
            guard let data = data, error == nil else {
               // print("nav2")
                        return
                    }

            do {
                
                    let decodedData = try JSONDecoder().decode([String: [ModelWorker]].self, from: data)
                                    if let workerList = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelworkers = workerList
                                        }
                    }
                
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
    }
}

struct AssemblySearchShip_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchShip(isPresented: Binding.constant(false))
    }
}
