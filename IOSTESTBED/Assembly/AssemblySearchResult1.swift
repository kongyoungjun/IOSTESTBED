//
//  AssemblySearchResult1.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/28.
//

import SwiftUI

struct AssemblySearchResult1: View {
    
    @State private var modelworkers: [ModelWorker] = []
    @State private var selectedWorker: ModelWorker?

    
    @State private var isDataLoaded = false
    @State private var isShowingPopup1 = false
    @State private var isShowingPopup2 = false
    @State private var isShowingPopup3 = false
    @State private var textShip: String = ""
    @State private var textProjno: String = ""
    @State private var textSubProjno: String = ""
    @State private var textProcno: String = ""
    
    
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
            
            Text(" 대형작업실적").font(.pretendardBold24)
            
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
                        
                        TextField("공사번호", text: $textProjno)
                                        .font(.pretendardBold14)
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
                            loadData()
                        }) {
                            Text("조회").font(.pretendardBold24)
                                .frame(height: 60)
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
                
            }
            .frame(width: .infinity, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                        Text("비고").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult9).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.9), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer()
                        VStack(alignment:.trailing, spacing: 1)
                        {
                            Button(action: {
                                isShowingPopup3 = true
                            }) {
                                Text("실적변경").font(.pretendardBold18)
                                    .frame(width:150, height: 30)
                                    //.padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                            }
                            .sheet(isPresented: $isShowingPopup3, content: {
                                AssemblySearchResult1Detail(isPresented: $isShowingPopup3, textProjno: $textProjno , textSubProjno: $textSubProjno,
                                    textProcno: $textProcno)
                                        })
                        }
                        
                       // Spacer(minLength: 1)
                    }
                }
            }
            .frame(width: .infinity, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
        
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/searchresult1.jsp?user_id=A372897&gubun=&projno=KAA007642&subprojno=001") else {
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

struct AssemblySearchResult1_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchResult1(isPresented: Binding.constant(false))
    }
}
