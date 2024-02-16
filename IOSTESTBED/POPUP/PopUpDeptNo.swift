//
//  PopUpDeptNo.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/28.
//

import SwiftUI

struct PopUpDeptNo: View {
    @Binding var isPresented: Bool
    @Binding var textDept: String
    //@Binding var state: Int
    
    
    @State private var modelpopupdepts: [ModelPopupDept] = []
    @State private var selecteddept: ModelPopupDept?
    
    @State private var selectedOption = 0
    @State private var textSelect: String = ""
    @State private var textValue: String = ""
    @State private var isLoading: Bool = false
    
    let options = ["부서코드","부서명"]
    
   
    
    var body: some View {
        
        
        VStack (alignment:.leading,  spacing: 3)
            {
            Button("< Back") {
               isPresented = false // Close the popup when tapped
               //state = 1
            }.frame(width:150, height: 40, alignment:.leading)
            Spacer()
            HStack
            {
                Button(action: {
                    
                }) {
                    Text("").frame(height: 20)
                }
            }
            Text(" 부서조회").font(.pretendardBold24)
            
            Divider()
            
            HStack {
                Text(" 검색조건:").font(.pretendardBold18)

                Spacer()
                VStack
                {
                    Picker("검색조건", selection: $selectedOption) {
                        ForEach(0..<options.count) {
                            index in Text(options[index]).tag(index)
                        }
                    }
                    .frame(width:100, height:20)
                    .clipped()
                }
                Spacer()

                TextField("", text: $textValue)
                                .font(.pretendardBold18)
                                .autocapitalization(.allCharacters)
                Button(action: {
                    var textReult : String = loadData(from: selectedOption, to: textValue)
                }) {
                    Image("iconsearch")
                        .padding(6)
                        .background(Color.blue)
                }
            }
            GeometryReader { geometry in

                HStack (alignment:.center, spacing: 1)
                {
                    let hstackwidth = geometry.size.width

                    Spacer(minLength: 1)
                    Button(action: {}) { Text("부서코드")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color.gray)
                    Button(action: {}) { Text("부서명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.7), minHeight: 10, maxHeight: 30).background(Color.gray)
                    Spacer(minLength: 1)

                }
            }.frame(width: .infinity, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            NavigationView {
                        VStack {
                            if isLoading {
                                                ProgressView("Loading...")
                                                    .progressViewStyle(CircularProgressViewStyle())
                                                    .padding()
                            } else {
                                List(modelpopupdepts , id: \.COLM1)
                                { modelpopupdept in
                                    HStack(alignment: .top) {
                                        Text("\(String(describing: modelpopupdept.COLM1))").font(.pretendardBold12)
                                            .onTapGesture {
                                                textDept = modelpopupdept.COLM1
                                                isPresented = false
                                            }
                                        Text("\(String(describing: modelpopupdept.COLM2))").font(.pretendardBold12).onTapGesture {
                                            textDept = modelpopupdept.COLM1
                                            isPresented = false 
                                        }
                                    }
                                }
                                .listStyle(.grouped)
                                
                            }
                            
                            
                        }
                        .navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
            
            
            
            Spacer()
            
            
        }
    }
    
    
    private func loadData(from selectInt : Int, to textValue : String) -> String {
        isLoading = true
        
        if selectInt == 0 {
            textSelect = "A"
        }
        else{
            textSelect = "B"
        }

        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/com/combo_dept.jsp?userid=A372897&COM_GUBUN=5&COM_DATA1=\(textSelect)&COM_DATA2=\(textValue)&COM_DATA3=&COM_DATA4=") else {
            //print("nav1")
            //return
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

                    let decodedData = try JSONDecoder().decode([String: [ModelPopupDept]].self, from: data)
                    if let popupDeptList = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelpopupdepts = popupDeptList
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

struct PopUpDeptNo_Previews: PreviewProvider {
    static var previews: some View {
        PopUpDeptNo(isPresented: Binding.constant(false), textDept: Binding.constant(""))
    }
}
