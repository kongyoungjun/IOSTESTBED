//
//  AssemblySearchMonitoring2.swift
//  IOSTESTBED
//
//  Created by  hhi on 2/4/24.
//

import SwiftUI

struct AssemblySearchMonitoring2: View {
    
    // BACK 화면
    @Binding var isPresented: Bool
    //
    @State private var isLoading: Bool = false
    
    @State private var modelsearchstroepics: [ModelSearchStorePic] = []
    @State private var selectedmodelsearchstore: ModelSearchStorePic?

    
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
    
    let options = ["전공장","힘센1공장","힘센2공장"]
    
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
            
            Text(" 힘센모니터링").font(.pretendardBold24)
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
                                List(modelsearchstroepics, id: \.EMPNO) { modelsearchstore in
                                    HStack(alignment: .top) {
                                      //  Text("\(modelsearchstore.EMPNO)")
                                      //  Text("\(modelsearchstore.DEPTNM)")
                                       // Text("\(modelsearchstore.MOBILE)")
                                    }
                                    .onTapGesture {
                                        selectedmodelsearchstore = modelsearchstore
                                      //  textSampel = selectedWorker!.EMPNO
                                    }
                                    
                                }
                            }
                        }
                        .navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
            }
            
        }
      
    }
    private func loadCombo(from textDept: String, to textTeam : String )-> String {
        isLoading = true
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/monitoring21.jsp?user_id=A372897&gubun=A302") else {
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
                
                    let decodedData = try JSONDecoder().decode([String: [ModelSearchStorePic]].self, from: data)
                if let SearchStorePics = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelsearchstroepics = SearchStorePics
                                        }
                    }
                
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
        return "OK"
    }
    private func loadData(from textDept: String, to textTeam : String )-> String {
        isLoading = true
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/monitoring21.jsp?user_id=A372897&gubun=A302") else {
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
                
                    let decodedData = try JSONDecoder().decode([String: [ModelSearchStorePic]].self, from: data)
                if let SearchStorePics = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelsearchstroepics = SearchStorePics
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

struct AssemblySearchMonitoring2_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchMonitoring2(isPresented: Binding.constant(false))
    }
}
