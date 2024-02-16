//
//  PopUpTeamNo.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/28.
//

import SwiftUI

struct PopUpTeamNo: View {
    @Binding var isPresented: Bool
    @Binding var textTeam: String
    
    @State private var modelpopupteams: [ModelPopupTeam] = []
    @State private var selectedteam: ModelPopupTeam?
    
    //@State private var selectedOption = 1
    //@State private var textDept: String = ""
    @State private var isLoading: Bool = false
    @State private var textCode: String = ""
    
    //let options = ["부서코드"]
    
    var body: some View {
        
        VStack (alignment:.leading,  spacing: 3)
            {
            Button("< Back") {
               isPresented = false // Close the popup when tapped
            }.frame(width:150, height: 40, alignment:.leading)
            Spacer()
            HStack
            {
                Button(action: {
                    
                }) {
                    Text("").frame(height: 20)
                }
            }
            Text(" 팀조회").font(.pretendardBold24)
            
            Divider()
            
            HStack {
                Text(" 부서코드:").font(.pretendardBold18)

                Spacer()

                TextField("", text: $textCode)
                                .font(.pretendardBold18).textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.allCharacters)
                
                Button(action: {
                    var textReult : String = loadData(from: textCode)
                }) {
                    Text("조회").font(.pretendardBold18)
                        .frame(height: 15)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
            }
            GeometryReader { geometry in

                HStack (alignment:.center, spacing: 1)
                {
                    let hstackwidth = geometry.size.width

                    Spacer(minLength: 1)
                    Button(action: {}) { Text("팀코드")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color.gray)
                    Button(action: {}) { Text("팀서명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.7), minHeight: 10, maxHeight: 30).background(Color.gray)
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
                                List(modelpopupteams, id: \.JOCODE) { modelteams in
                                    HStack(alignment: .top) {
                                        Text("\(String(describing: modelteams.JOCODE))").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 90, minHeight: 10, maxHeight: 30 , alignment: .center)
                                        Text("\(String(describing: modelteams.JONAME))").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 210, minHeight: 10, maxHeight: 30 , alignment: .center)
                                    }
                                    .onTapGesture {
                                        textTeam = modelteams.JOCODE
                                        isPresented = false
                                    }

                                }
                                .listStyle(.grouped)
                            }
                            
                            
                        }
                        .navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
            }
            
            
            
            Spacer()
            
            
        }
    }
    
    private func loadData(from textDept : String) -> String {
        //print("nav")
        isLoading = true

        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/com/combo_team.jsp?userid=A372897&dept=\(textDept)")
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

                    let decodedData = try JSONDecoder().decode([String: [ModelPopupTeam]].self, from: data)
                    if let teamList = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelpopupteams = teamList
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

struct PopUpTeamNo_Previews: PreviewProvider {
    static var previews: some View {
        PopUpTeamNo(isPresented: Binding.constant(false), textTeam: Binding.constant(""))
    }
}
