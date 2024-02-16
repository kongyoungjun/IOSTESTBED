

import SwiftUI

struct WorkerList: View {
    
    //let screenWidth = UIScreen.main.bounds.size.width
    
    @State private var modelworkers: [ModelWorker] = []
    @State private var selectedWorker: ModelWorker?

    
    @State private var isDataLoaded = false
    @State private var isShowingPopup = false
    @State private var textShip: String = ""
    @State private var textProjno: String = ""
    
    
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
    
    
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    
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
            
        
            HStack
            {
                VStack(alignment:.leading,  spacing: 3)
                {
                    HStack{
                           Text(" 구분:").font(.pretendardBold14)
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
                          Spacer()
                          Spacer()
                          Spacer()
                        
    
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
                    
                    
                     
                    
                }
                Spacer()
                HStack
                {
                        Button(action: {
                            loadData()
                        }) {
                            Text("조회").font(.pretendardBold24)
                                .frame(height: 100)
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
                //DatePicker(selection: $selectedFromDate, in: ...Date(), displayedComponents: .date) {}
               DatePicker("Select Date", selection: $selectedFromDate, in: ...Date(), displayedComponents: .date).labelsHidden().font(.pretendardBold12)
                Text(" ~ ").font(.pretendardBold14)
               DatePicker("Select Date", selection: $selectedToDate, in: ...Date(), displayedComponents: .date).labelsHidden().font(.pretendardBold12)
               Spacer()
                              
            }
            
            Spacer()
            //UIScreen.main.bounds.size.width
            HStack (alignment:.center, spacing: 1)
            {
                Spacer(minLength: 1)
                Button(action: {}) { Text("호선번호").font(.pretendardBold14).frame(minWidth:0, maxWidth: .infinity, minHeight: 10, maxHeight: 10).padding().foregroundColor(.white).background(Color.gray)}
                Button(action: {}) { Text("공사번호").font(.pretendardBold14) .frame(minWidth:0, maxWidth: .infinity, minHeight: 10, maxHeight: 10).padding() .foregroundColor(.white) .background(Color.gray)}
                Button(action: {}) { Text("타입").font(.pretendardBold12) .frame(minWidth:0, maxWidth: .infinity, minHeight: 10, maxHeight: 10).padding() .foregroundColor(.white) .background(Color.gray)}
                Button(action: {}) { Text("공시일").font(.pretendardBold12) .frame(minWidth:0, maxWidth: .infinity, minHeight: 10, maxHeight: 10).padding() .foregroundColor(.white) .background(Color.gray)}
                Spacer(minLength: 1)

            }
//            NavigationView {
//                     List {
//                         ForEach(items.indices, id: \.self) { index in
//                             Toggle(isOn: self.$items[index].isChecked) {
//                                 Text(self.items[index])
//                             }
//                         }
//                     }
//                     .navigationBarTitle("Checkbox List")
//                 }
            
//            NavigationView {
//                    List {
//                        ForEach(items.indices, id: \.self) { index in
//                            Toggle(isOn: self.$items[index].isChecked) {
//                                Text(self.items[index])
//                            }
//                        }
//                    }
//                    .navigationBarTitle("Checkbox List")
//                }
            
//            NavigationView {
//                        VStack {
//                            if isLoading {
//                                                ProgressView("Loading...")
//                                                    .progressViewStyle(CircularProgressViewStyle())
//                                                    .padding()
//                            } else {
//                                List{
//                                    
//                                    ForEach(items.indices, id: \.self) { index in
//                                        Toggle(isOn: self.$items[index].isChecked) {
//                                            Text(self.items[index])
//                                        }
//                                    }
//                                    
//                                    //                                    modelworkers in
//                                    //                                    HStack(alignment: .top) {
//                                    //                                        Text("\(modelworkers.EMPNO)")
//                                    //                                        Text("\(modelworkers.DEPTNM)")
//                                    //                                        Text("\(modelworkers.MOBILE)")
//                                    //                                    }
//                                    //.onTapGesture {
//                                    // selectedWorker = modelworkers
//                                    //  textSampel = selectedWorker!.EMPNO
//                                    //  }
//                                    
//                                }
//                            }
//                            
//                            
//                            
//                        }//.onAppear(perform: loadData)
//                        .navigationBarHidden(true)
//                        //.navigationBarTitleDisplayMode(.inline)
//                        .navigationBarTitle("", displayMode: .automatic)
//                        //
//                        //.navigationTitle("Custom List")
//            }
            VStack(spacing: 1)
            {
                HStack(alignment:.center, spacing: 1)
                {
                    Spacer(minLength: 1)
                    Text("호선번호").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: .infinity * 1/10, minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                    TextField("", text: $textResult1).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: .infinity * 4/10, minHeight: 10, maxHeight: 30).foregroundColor(.black).background(Color(UIColor.secondarySystemBackground))
                    Text("공사번호").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: .infinity * 1/10, minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                    TextField("", text: $textResult2).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: .infinity * 4/10, minHeight: 10, maxHeight: 30).foregroundColor(.black).background(Color(UIColor.secondarySystemBackground))
                    Spacer(minLength: 1)
                }
                HStack(alignment:.center, spacing: 1)
                {
                    Spacer(minLength: 1)
                    Text("엔진타입").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: .infinity * 1/10, minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                    TextField("", text: $textResult3).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: .infinity * 4/10, minHeight: 10, maxHeight: 30).foregroundColor(.black).background(Color(UIColor.secondarySystemBackground))
                    Text("공시일자").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: .infinity * 1/10, minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                    TextField("", text: $textResult4).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: .infinity * 4/10, minHeight: 10, maxHeight: 30).foregroundColor(.black).background(Color(UIColor.secondarySystemBackground))
                    Spacer(minLength: 1)
                    
//                    Spacer(minLength: 1)
//                    Text("엔진타입").font(.pretendardBold14).frame(width: 60, height: 10).foregroundColor(.blue).padding().background(colorwhiteblue)
//                    TextField("", text: $textSampel).frame(width: 60, height: 10).padding().background(Color(UIColor.secondarySystemBackground))
//                    Text("공시일자").font(.pretendardBold14).frame(width: 60, height: 10).foregroundColor(.blue).padding().background(colorwhiteblue)
//                    TextField("", text: $textSampel).frame(width: 60, height: 10).padding().background(Color(UIColor.secondarySystemBackground))
//                    Spacer(minLength: 1)
                }
                HStack(alignment:.center, spacing: 1)
                {
                    Spacer(minLength: 1)
                    Text("조선소").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: .infinity * 1/10, minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                    TextField("", text: $textResult5).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: .infinity * 4/10, minHeight: 10, maxHeight: 30).foregroundColor(.black).background(Color(UIColor.secondarySystemBackground))
                    Text("베딩일자").font(.pretendardBold14).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: .infinity * 1/10, minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                    TextField("", text: $textResult6).font(.pretendardBold14).padding().frame(minWidth:0, maxWidth: .infinity * 4/10, minHeight: 10, maxHeight: 30).foregroundColor(.black).background(Color(UIColor.secondarySystemBackground))
                    Spacer(minLength: 1)
                    
//                    Spacer(minLength: 1)
//                    Text("조선소").font(.pretendardBold14).frame(width: 60, height: 10).foregroundColor(.blue).padding().background(colorwhiteblue)
//                    TextField("", text: $textSampel).frame(width: 60, height: 10).padding().background(Color(UIColor.secondarySystemBackground))
//                    Text("베딩일자").font(.pretendardBold14).frame(width: 60, height: 10).foregroundColor(.blue).padding().background(colorwhiteblue)
//                    TextField("", text: $textSampel).frame(width: 60, height: 10).padding().background(Color(UIColor.secondarySystemBackground))
//                    Spacer(minLength: 1)
                }
//                HStack(alignment:.center, spacing: 1)
//                {
//                    Spacer(minLength: 1)
//                    Text("BED").font(.pretendardBold14).frame(width: 60, height: 10).foregroundColor(.blue).padding().background(colorwhiteblue)
//                    TextField("", text: $textSampel).frame(width: 60, height: 10).padding().background(Color(UIColor.secondarySystemBackground))
//                    Text("조립부서").font(.pretendardBold14).frame(width: 60, height: 10).foregroundColor(.blue).padding().background(colorwhiteblue)
//                    TextField("", text: $textSampel).frame(width: 60, height: 10).padding().background(Color(UIColor.secondarySystemBackground))
//                    Spacer(minLength: 1)
//                }
//                HStack(alignment:.center, spacing: 1)
//                {
//                    Spacer(minLength: 1)
//                    Text("선주").font(.pretendardBold14).frame(width: 60, height: 10).foregroundColor(.blue).padding().background(colorwhiteblue)
//                    TextField("", text: $textSampel).frame(width: 60, height: 10).padding().background(Color(UIColor.secondarySystemBackground))
//                    Text("국적").font(.pretendardBold14).frame(width: 60, height: 10).foregroundColor(.blue).padding().background(colorwhiteblue)
//                    TextField("", text: $textSampel).frame(width: 60, height: 10).padding().background(Color(UIColor.secondarySystemBackground))
//                    Spacer(minLength: 1)
//                }
            }
            
            
//            TextField("", text: $textSampel).padding()
//                    .background(Color(UIColor.secondarySystemBackground))
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


// 모델 구조체
struct ListItem: Identifiable {
    var id = UUID()
    var title: String
    var isChecked: Bool = false
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

