//
//  PopUpTeamNo.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/28.
//

import SwiftUI

struct PopUpTeamNo: View {
    @Binding var isPresented: Bool
    
    @State private var selectedOption = 1
    @State private var textDept: String = ""
    @State private var isLoading: Bool = false
    
    let options = ["부서코드"]
    
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
            Text(" 팀조회").font(.pretendardBold24)
            
            Divider()
            
            HStack {
                Text(" 부서코드:").font(.pretendardBold18)

                Spacer()

                TextField("", text: $textDept)
                                .font(.pretendardBold18)
                Button(action: {
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
//                                List(modelworkers, id: \.EMPNO) { modelworkers in
//                                    HStack(alignment: .top) {
//                                        Text("\(modelworkers.EMPNO)")
//                                        Text("\(modelworkers.DEPTNM)")
//                                        Text("\(modelworkers.MOBILE)")
//                                    }
//                                    .onTapGesture {
//                                        selectedWorker = modelworkers
//                                      //  textSampel = selectedWorker!.EMPNO
//                                    }
//
//                                }
                            }
                            
                            
                        }
                        .navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
            }
            
            
            
            Spacer()
            
            
        }
    }
    
    private func loadData(from selectInt : Int, to textShip : String) -> String {
        //print("nav")
        isLoading = true

        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/com/combo_projno.jsp?userid=A372897&COM_GUBUN=SHIP_01&COM_DATA1=A&COM_DATA2=KBA007410&COM_DATA3=&COM_DATA4=") else {
            //print("nav1")
            //return
            return "ERROR"
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
                                            //modelworkers = workerList
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
        PopUpTeamNo(isPresented: Binding.constant(false))
    }
}
