

import SwiftUI

extension Font {
    
    // Bold
    static let pretendardBold28: Font = .custom("Pretendard-Bold", size: 28)
    static let pretendardBold24: Font = .custom("Pretendard-Bold", size: 24)
    static let pretendardBold18: Font = .custom("Pretendard-Bold", size: 18)
    static let pretendardBold14: Font = .custom("Pretendard-Bold", size: 14)
    
    // SemiBold
    static let pretendardSemiBold16: Font = .custom("Pretendard-SemiBold", size: 16)
    
    // Medium
    static let pretendardMedium18: Font = .custom("Pretendard-Medium", size: 18)
    static let pretendardMedium16: Font = .custom("Pretendard-Medium", size: 16)
    
    // Regular
    static let pretendardRegular14: Font = .custom("Pretendard-Regular", size: 14)
    static let pretendardRegular16: Font = .custom("Pretendard-Regular", size: 16)
    
}



struct WorkerList: View {
    
    @State private var modelworkers: [ModelWorker] = []
    @State private var selectedWorker: ModelWorker?

    
    @State private var isDataLoaded = false
    @State private var isShowingPopup = false
    @State private var textShip: String = ""
    @State private var textProjno: String = ""
    
    
    @State private var textSampel: String = ""
    
    @State var state: Int  = 0;
    @Binding var isPresented: Bool
    
    @State private var isBigEngine: Bool = true
    @State private var isLoading: Bool = false
    
    @State private var selectedFromDate = Date()
    @State private var selectedToDate = Date()
    
    
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
            
            Text(" 호선정보조회").font(.pretendardBold24)
            
            Divider()
            
            
            VStack(alignment:.center,  spacing: 3)
            {
                HStack(alignment:.center,  spacing: 0){
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
                    
                        Button(action: {
                            loadData()
                        }) {
                            Text("조회").font(.pretendardBold24)
                                .frame(height: 10)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
//                        Button(action: {
//                            clearData()
//                        }) {
//                            Text("C ")
//                                .frame(height: 10)
//                        }.padding()
                }
                
                HStack
                {
                    Text(" 호선번호:").font(.pretendardBold14)
                    TextField("호선번호", text: $textShip)
                                    .font(.pretendardBold14)
                                   .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        //isBigEngine = false
                    }) {
                        Image("iconsearch")
                            .padding(6)
                            .background(Color.blue)
                    }
                }
                HStack
                {
                    Text(" 공사번호:").font(.pretendardBold14)
                    
                    TextField("공사번호", text: $textProjno)
                                    .font(.pretendardBold14)
                                   .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        //isBigEngine = false
                    }) {
                        Image("iconsearch")
                            .padding(6)
                            .background(Color.blue)
                    }
                }
                
                
                 HStack (spacing: 0)
                 {
                     Text(" 공시일  :").font(.pretendardBold14)
                     DatePicker(selection: $selectedFromDate, in: ...Date(), displayedComponents: .date) {
                     }
                    DatePicker(selection: $selectedToDate, in: ...Date(), displayedComponents: .date) {
                            }
                    Spacer()


                 }
                
            }
            NavigationView {
                        
                        VStack {
                            if isLoading {
                                                ProgressView("Loading...")
                                                    .progressViewStyle(CircularProgressViewStyle())
                                                    .padding()
                            } else {
                                List(modelworkers, id: \.EMPNO) { modelworkers in
                                    HStack(alignment: .top) {
                                        Text("U: \(modelworkers.EMPNO)")
                                        Text("D: \(modelworkers.DEPTNM)")
                                        Text("E: \(modelworkers.MOBILE)")
                                    }
                                    .onTapGesture {
                                        selectedWorker = modelworkers
                                        textSampel = selectedWorker!.EMPNO
                                    }
                                    
                                }
                            }
                            
                            
                        }//.onAppear(perform: loadData)
                        .navigationBarHidden(true)
                        //.navigationBarTitleDisplayMode(.inline)
                        .navigationBarTitle("", displayMode: .automatic)
                        //
                        //.navigationTitle("Custom List")
                    }
            
            
            HStack
            {
                Text("Swift UI")
                    .padding()
                    .background(Color.yellow)
                
                TextField("", text: $textSampel)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                
//                HStack
//                {
//                    Text("TEST:")
//                }.background(Color.green)
//                HStack{
//                    TextField("Enter text", text: $textInput)
//                                   .textFieldStyle(RoundedBorderTextFieldStyle())
//                                   .padding()
//                                   .frame(width: 200)
//                }
                
            }
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
//    private func loadDataEx() {
//            // Fetch and decode JSON data
//            if let fileURL = Bundle.main.url(forResource: "data", withExtension: "json") {
//                do {
//                    let data = try Data(contentsOf: fileURL)
//                    let decodedItems = try JSONDecoder().decode([SampleItem].self, from: data)
//                    self.items = decodedItems
//                    isDataLoaded = true
//                } catch {
//                   // print("Error decoding JSON: \(error.localizedDescription)")
//                }
//            }
//        }
//    }



struct WorkerList_Previews: PreviewProvider {
    static var previews: some View {
        WorkerList(isPresented: Binding.constant(false))
        //.environmentObject(ModelData())
    }
}




//            VStack(spacing: 0)
//            {
//                HStack
//                {
//                    Text(" 호선번호:").font(.pretendardBold14)
//                    TextField("Enter text", text: $textShip)
//                                    .font(.pretendardBold14)
//                                   .textFieldStyle(RoundedBorderTextFieldStyle())
//                                   .padding()
//                    Button(action: {
//                        //isBigEngine = false
//                    }) {
//                        Image("iconsearch")
//                            .padding(8)
//                            .background(Color.blue)
//                    }
//                }
//                HStack
//                {
//                    Text(" 호선번호:").font(.pretendardBold14)
//                    TextField("Enter text", text: $textShip)
//                                    .font(.pretendardBold14)
//                                   .textFieldStyle(RoundedBorderTextFieldStyle())
//                                   .padding()
//                    Button(action: {
//                        //isBigEngine = false
//                    }) {
//                        Image("iconsearch")
//                            .padding(8)
//                            .background(Color.blue)
//                    }
//                }
//                Spacer()
//            }







//            Button("Load Popup Data") {
//                isShowingPopup.toggle()
//            }
//            .sheet(isPresented: $isShowingPopup, content: {
//                WorkerListPopup(isPresented: $isShowingPopup, state: $state)
//                                //.frame(width: 300, height: 100)
//                        })

