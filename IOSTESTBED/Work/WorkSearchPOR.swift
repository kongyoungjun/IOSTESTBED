//
//  WorkSearchPOR.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/23.
//

import SwiftUI

struct WorkSearchPOR: View {
    
    // BACK 화면
    @Binding var isPresented: Bool

    //@StateObject var userDataPor = UserData()
    @State private var modelsearchpors: [ModelSearchPor] = []
    @State private var selectedmodelsearchpor: ModelSearchPor?
    
    @State private var showAlert = false
    @State private var showAlert_change = false
    @State private var isLoading: Bool = false
    
    @State private var isDataLoaded = false
    @State private var isShowingPopup2 = false
    @State private var isShowingProjNo = false
    //@State private var textProjNo: String = ""
    @State private var textProjno: String = ""
    @State private var textPart: String = ""
    @State var state: Int  = 0;
    
    
    @State private var textResult1: String = ""
    @State private var textResult2: String = ""
    @State private var textResult3: String = ""
    @State private var textResult4: String = ""
    @State private var textResult5: String = ""
    @State private var textResult6: String = ""
    @State private var textResult7: String = ""
    @State private var textResult8: String = ""
    @State private var textResult9: String = ""
    
    let colorwhiteblue = Color(red: 243/255, green: 248/255, blue: 255/255)
    let colordarkblue = Color(red: 0/255, green: 23/255, blue: 51/255)
    
    var body: some View {
        VStack (alignment:.leading,  spacing: 3)
        {
            Button(action: {
                isPresented = false
            }) {
                Text("< Back").frame(height: 10)
                    
                      //  .ignoresSafeArea()
            }
            Spacer()
            
            Text(" POR 조회").font(.pretendardBold24)
            
            Divider()
            
        
            HStack
            {
                VStack(alignment:.leading,  spacing: 3)
                {
                    HStack
                    {
                        Text(" 공사번호:").font(.pretendardBold14)
                        TextField("", text: $textProjno)
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
                    HStack
                    {
                        Text(" 자재명:").font(.pretendardBold14)
                        
                        TextField("", text: $textPart)
                                        .font(.pretendardBold14)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                    }
                    
                    
                     
                    
                }
                Spacer()
                HStack
                {
                        Button(action: {
                            if textProjno.isEmpty {
                               showAlert = true
                                
                           } else {
                               var textReult : String = loadData(from: textProjno, to: textPart)
                           }
                            
                            
                        }) {
                            Text("조회").font(.pretendardBold24)
                                .frame(height: 70)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                .alert(isPresented: $showAlert) {
                   Alert(
                       title: Text("Alert"),
                       message: Text("공사번호 값이 없습니다"),
                       dismissButton: .default(Text("OK"))
                   )
                }
                Spacer()
            }
            
           
                       
            Spacer()
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack(alignment:.center, spacing: 1)
                {
                    HStack (alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Button(action: {}) { Text("PORNO")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.6), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("수량")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("상태")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Spacer(minLength: 1)

                    }
                    HStack (alignment:.center, spacing: 1)
                    {
                        
                        Spacer(minLength: 1)
                        Button(action: {}) { Text("자재명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.6), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("소요일")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.4), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Spacer(minLength: 1)

                    }
                }
                
            }.frame(width: .infinity, height: 60, alignment:.center)
            
            NavigationView {
                        VStack {
                            if isLoading {
                                                ProgressView("Loading...")
                                                    .progressViewStyle(CircularProgressViewStyle())
                                                    .padding()
                            } else {
                                List(modelsearchpors, id: \.PORNO) { modelsearchpor in
                                    VStack(alignment:.center, spacing: 1)
                                    {
                                        let nullString = ""
                                        HStack(alignment: .top) {
                                            Text("\(modelsearchpor.PORNO)").font(.pretendardBold12)
                                                .frame(minWidth:0, maxWidth: 240, minHeight: 10, maxHeight: 30 , alignment: .center)
                                            Text("\(modelsearchpor.QTY ?? nullString)").font(.pretendardBold12)
                                                .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30 , alignment: .center)
                                            Text("").font(.pretendardBold12)
                                                .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30 , alignment: .center)
                                        }
                                        HStack(alignment: .top) {
                                            Text("\(modelsearchpor.MSTDSC ?? nullString)").font(.pretendardBold12)
                                                .frame(minWidth:0, maxWidth: 240, minHeight: 10, maxHeight: 30 , alignment: .center)
                                            Text("\(modelsearchpor.SOYOIL ?? nullString)").font(.pretendardBold12)
                                                .frame(minWidth:0, maxWidth: 160, minHeight: 10, maxHeight: 30 , alignment: .center)
                                        }
                                    }
                                    
                                    .onTapGesture {
                                        selectedmodelsearchpor = modelsearchpor
                                        findDetails(select : modelsearchpor)
                                      //  textSampel = selectedWorker!.EMPNO
                                    }
                                    
                                }
                                .listStyle(.grouped)
                            }
                        }
                        .navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
            }
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                
                VStack(spacing: 1)
                {
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("PORNO").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult1).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("수량").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult2).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("계약수량").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult3).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("상태").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult4).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                        
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("자재명").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult5).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.8), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                        
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("공사번호").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult6).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("입고일").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult7).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                        
                    }
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("소요일").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult8).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Text("업체명").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textResult9).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color(UIColor.secondarySystemBackground))
                        Spacer(minLength: 1)
                        
                    }
                }
            }
            .frame(width: .infinity, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
      
    }
    
    private func findDetails(select searchPor : ModelSearchPor)
    {
        let nullString = ""
        textResult1 = searchPor.PORNO
        textResult2 = searchPor.QTY ?? nullString
        textResult3 = searchPor.ORDQTY ?? nullString
        textResult4 = ""
        textResult5 = searchPor.MSTDSC ?? nullString
        textResult6 = searchPor.PROJNO ?? nullString
        textResult7 = ""
        textResult8 = searchPor.SOYOIL ?? nullString
        textResult9 = searchPor.VNDNME ?? nullString
    }
    
    private func loadData(from textProjNo : String, to textPart : String) -> String {
        isLoading = true
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/searchpor.jsp?projno=\(textProjNo)&procno=\(textPart)") else {
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
                
                    let decodedData = try JSONDecoder().decode([String: [ModelSearchPor]].self, from: data)
                                    if let modelSearchPors = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelsearchpors = modelSearchPors
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

struct WorkSearchPOR_Previews: PreviewProvider {
    static var previews: some View {
            WorkSearchPOR(isPresented: Binding.constant(false))
        }
    
}
