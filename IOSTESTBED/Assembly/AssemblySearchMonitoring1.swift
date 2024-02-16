//
//  AssemblySearchMonitoring1.swift
//  IOSTESTBED
//
//  Created by  hhi on 2/4/24.
//

import SwiftUI

struct AssemblySearchMonitoring1: View {
    
    // BACK 화면
    @Binding var isPresented: Bool
    
   // @StateObject var userDataMonitoring1 = UserData()
    
    
    @State private var modelmonitoring11s: [ModelSearchMonitoring11] = []
    @State private var selectedmodelmonitoring11: ModelSearchMonitoring11?
    @State private var isLoading: Bool = false

    
    @State private var isDataLoaded = false
    @State private var isShowingPopup = false
    //@State private var isShowing = false
    @State private var isShowingProjNo = false
    @State private var textWareHouse: String = ""
    @State private var selectedDate = Date()
    @State var state: Int  = 0;
    @State private var textTeam: String = ""
    @State private var selectedOption = 0
    
    
    
    let colorwhiteblue = Color(red: 243/255, green: 248/255, blue: 255/255)
    let colordarkblue = Color(red: 0/255, green: 23/255, blue: 51/255)
    
    let options = ["ALL"]
    
    var body: some View {
        VStack (alignment:.leading,  spacing: 3)
        {
            
            Button(action: {
                isPresented = false
            }) {
                Text("< Back")
            }.frame(width:150, height: 50, alignment:.leading)
            Spacer()
            HStack
            {
                Button(action: {

                }) {
                    Text("").frame(height: 1)
                }
            }
            
            Text(" 대형모니터링").font(.pretendardBold24)
            Divider()
            
            
            HStack {
                
                
                VStack(alignment:.leading,  spacing: 3)
                {
                    HStack
                    {
                        Text(" 공장 :").font(.pretendardBold18)
                        
                        Spacer()
                        VStack
                        {
                           Picker("검색조건", selection: $selectedOption) {
                               ForEach(0..<options.count) {
                                   index in Text(options[index]).tag(index)
                               }
                           }
                           .frame(width:200, height:30)
                           .clipped()
                        }
                        Spacer()
                        
//                        TextField("", text: $textWareHouse)
//                                        .font(.pretendardBold18)
                        Button(action: {
                            var textReult : String = loadData(from: textWareHouse, to: textTeam)
                        }) {
                            Text("조회").font(.pretendardBold24)
                                .frame(height: 40)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        
                    }
                }
                
            }
        
            
           
                       
            Spacer()
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack{
                    HStack (alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Button(action: {}) { Text("호선")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.20), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("엔진타입")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.20), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("시작")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("종료")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("BED")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.10), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("진행")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.10), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("상태")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.10), minHeight: 10, maxHeight: 30).background(Color.gray)
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
                                List(modelmonitoring11s, id: \.PROJNO) { modelmonitoring11 in
                                    HStack(alignment: .top) {
                                        let nullString = ""
                                        Text("\(modelmonitoring11.TEXT1 ?? nullString)").font(.pretendardBold10)
                                            .frame(minWidth:0, maxWidth: 100, minHeight: 10, maxHeight: 30 , alignment: .leading)
                                        Text("\(modelmonitoring11.TEXT2 ?? nullString)").font(.pretendardBold10)
                                            .frame(minWidth:0, maxWidth: 130, minHeight: 10, maxHeight: 30, alignment: .center)
                                        Text("\(modelmonitoring11.TEXT3 ?? nullString)").font(.pretendardBold10)
                                            .frame(minWidth:0, maxWidth: 50, minHeight: 10, maxHeight: 30, alignment: .center)
                                        Text("\(modelmonitoring11.TEXT4 ?? nullString)").font(.pretendardBold10)
                                            .frame(minWidth:0, maxWidth: 50, minHeight: 10, maxHeight: 30, alignment: .center)
                                        Text("\(modelmonitoring11.TEXT5 ?? nullString)").font(.pretendardBold10)
                                            .frame(minWidth:0, maxWidth: 30, minHeight: 10, maxHeight: 30, alignment: .center)
                                        Text("\(modelmonitoring11.PROCPROGRESS ?? nullString)").font(.pretendardBold10)
                                            .frame(minWidth:0, maxWidth: 30, minHeight: 10, maxHeight: 30, alignment: .center)
                                        Text("\(modelmonitoring11.STATUS ?? nullString)").font(.pretendardBold10)
                                            .frame(minWidth:0, maxWidth: 30, minHeight: 10, maxHeight: 30, alignment: .center)
                                    }
                                    .onTapGesture {
                                        selectedmodelmonitoring11 = modelmonitoring11
                                      //  textSampel = selectedWorker!.EMPNO
                                    }
                                    
                                }
                                .listStyle(.grouped)
                            }
                        }
                        .navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
            }
            
        }
      
    }
    
    private func loadData(from textDept: String, to textTeam : String )-> String {
        isLoading = true
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/monitoring11.jsp?user_id=\("")&gubun=ALL") else {
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
                
                    let decodedData = try JSONDecoder().decode([String: [ModelSearchMonitoring11]].self, from: data)
                if let listSearchMonitoring1 = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelmonitoring11s = listSearchMonitoring1
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

struct AssemblySearchMonitoring1_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchMonitoring1(isPresented: Binding.constant(false))
    }
}
