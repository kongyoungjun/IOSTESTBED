

import SwiftUI

struct CommonSearchWorker: View {
    
    // BACK 화면
    @Binding var isPresented: Bool
    //
    @State private var isLoading: Bool = false
    
    @State private var modelworkers: [ModelWorker] = []
    @State private var selectedworker: ModelWorker?

    @State private var showAlert = false
    
    @State private var isDataLoaded = false
    @State private var isShowingPopup = false
    //@State private var isShowing = false
    @State private var isShowingProjNo = false
    @State private var textName: String = ""
    @State private var textDept: String = ""
    @State private var textWareHouse: String = ""
    @State private var selectedDate = Date()
    @State var state: Int  = 0;
    @State private var textTeam: String = ""
    @State private var selectedOption = 0
    
    //@State var isPresentedFloating: Bool = false
    
    
    let colorwhiteblue = Color(red: 243/255, green: 248/255, blue: 255/255)
    let colordarkblue = Color(red: 0/255, green: 23/255, blue: 51/255)
    

    var body: some View {
        VStack (alignment:.leading,  spacing: 3)
        {
            
            Button(action: {
                isPresented = false
            }) {
                Text("< Back").frame(width:150, height: 40, alignment:.leading)
            }
            Spacer()
            HStack
            {
                Button(action: {

                }) {
                    Text("").frame(height: 1)
                }
            }
            
            Text(" 사원조회").font(.pretendardBold24)
            Divider()
            
            
            HStack {
                
                
                VStack(alignment:.leading,  spacing: 3)
                {
                    HStack
                    {
                        Text(" 성명 :").font(.pretendardBold14)
                        
                        Spacer()
                        
                        TextField("", text: $textName)
                                        .font(.pretendardBold14).textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }
                    HStack
                    {
                        Text(" 부서 :").font(.pretendardBold14)
                        TextField("", text: $textDept)
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
                                PopUpDeptNo(isPresented: $isShowingPopup , textDept: $textDept)})
                       
                    }
                    
                }
                Spacer()
                HStack
                {
                        Button(action: {
                            
                            if textDept.isEmpty {
                               showAlert = true
                           } else {
                               var textReult : String = loadData(from: textName, to: textDept)
                          
                           }
                            
                            
                        }) {
                            Text("조회").font(.pretendardBold24)
                                .frame(height: 40)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                .alert(isPresented: $showAlert) {
                   Alert(
                       title: Text("Alert"),
                       message: Text("부서를 넣어주세요"),
                       dismissButton: .default(Text("OK"))
                   )
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
                        Button(action: {}) { Text("부서명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.30), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("성명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("사무실")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("전화번호")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Spacer(minLength: 1)

                    }
                   
                }
                
                
                
            }.frame(width: .infinity, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            NavigationView {
                VStack ()
                {
                            if isLoading {
                                                ProgressView("Loading...")
                                                    .progressViewStyle(CircularProgressViewStyle())
                                                    .padding()
                            } else {
                                //List(modelworkers, id: \.EMPNO)
                                List(modelworkers , id: \.EMPNO)
                                {
                                    modelworker in
                                    HStack(alignment: .top) {
                                        Text("\(modelworker.DEPTNM)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 140, minHeight: 10, maxHeight: 30 , alignment: .center)
                                        Text("\(modelworker.EMPNM)").font(.pretendardBold12).frame(minWidth:0, maxWidth: 40, minHeight: 10, maxHeight: 30, alignment: .center)
                                        Text("\(modelworker.TELNO)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 60, minHeight: 10, maxHeight: 30, alignment: .center)
                                            .onTapGesture{
                                            if let phoneURL = URL(string: "tel://052-20\(modelworker.TELNO)") {
                                                                    UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                                                                }
                                        }
                                        Text("\(modelworker.MOBILE)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 120, minHeight: 10, maxHeight: 30, alignment: .center)
                                            .onTapGesture{
                                                if let phoneURL = URL(string: "tel://\(modelworker.MOBILE)") {
                                                                        UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                                                                    }
                                            }
                                    }
                                    
                                    
                                }
                                .listStyle(.grouped)
                            }
                        }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode: .automatic).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
           
        }
      
    }
    
    
    
    private func clearData() {
        modelworkers.removeAll()
    }
    
    private func loadData(from textName: String, to textDept : String )-> String {
        isLoading = true
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/searchworker.jsp?userid=A372897&deptcd=\(textDept)&empnm=\(textName)") else {
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
        return "OK"
    }
}

struct CommonSearchWorker_Previews: PreviewProvider {
    static var previews: some View {
        //CommonSearchWorker()
        CommonSearchWorker(isPresented: Binding.constant(false))
    }
}
