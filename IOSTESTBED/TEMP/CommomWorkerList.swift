//
//  CommomWorkerList.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/09.
//

import SwiftUI

struct CommomWorkerList: View {
    
    // BACK 화면
    @Binding var isPresented: Bool
    //
    @State private var isLoading: Bool = false
    
    @State private var modelsearchpors: [ModelSearchPor] = []
    @State private var selectedmodelsearchpor: ModelSearchPor?

    
    @State private var isDataLoaded = false
    @State private var isShowingPopup = false
    @State private var isShowingProjNo = false
    @State private var textProjNo: String = ""
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
            
            Text(" 사원 조회").font(.pretendardBold24)
            
            Divider()
            
        
            HStack
            {
                VStack(alignment:.leading,  spacing: 3)
                {
                    HStack
                    {
                        Text(" 성명:").font(.pretendardBold14)
                        
                        TextField("", text: $textPart)
                                        .font(.pretendardBold14)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                    }
                    HStack
                    {
                        Text(" 부서:").font(.pretendardBold14)
                        TextField("", text: $textProjNo)
                                        .font(.pretendardBold14)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            isShowingPopup = true
                        }) {
                            Image("iconsearch")
                                .padding(6)
                                .background(Color.blue)
                        }
//                        .sheet(isPresented: $isShowingPopup, content: {
//                                PopUpShipNo(isPresented: $isShowingPopup)})
                    }
                    
                    
                    
                     
                    
                }
                Spacer()
                HStack
                {
                        Button(action: {
                            var textReult : String = loadData(from: textProjNo, to: textPart)
                        }) {
                            Text("조회").font(.pretendardBold24)
                                .frame(height: 70)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                Spacer()
            }
            
           
                       
            Spacer()
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack{
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
                
            }.frame(width: .infinity, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            NavigationView {
                        VStack {
                            if isLoading {
                                                ProgressView("Loading...")
                                                    .progressViewStyle(CircularProgressViewStyle())
                                                    .padding()
                            } else {
                                List(modelsearchpors, id: \.PROJNO) { modelsearchpor in
                                    HStack(alignment: .top) {
                                       // Text("\(modelsearchpor.EMPNO)")
                                       // Text("\(modelsearchpor.DEPTNM)")
                                       // Text("\(modelsearchpor.MOBILE)")
                                    }
                                    .onTapGesture {
                                        selectedmodelsearchpor = modelsearchpor
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
    
    private func loadData(from textPor : String, to textPart : String) -> String {
        isLoading = true
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/searchpor.jsp?projno=KBA007684&procno=SEALING") else {
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

struct CommomWorkerList_Previews: PreviewProvider {
    static var previews: some View {
        CommomWorkerList(isPresented: Binding.constant(false))
    }
}
