
import SwiftUI

struct WorkSearchWorker: View {
    
    // BACK 화면
    @Binding var isPresented: Bool
    //
    @State private var isLoading: Bool = false
    
    @State private var modelsearchworkers: [ModelSearchWorker] = []
    @State private var selectedmodelsearchworker: ModelSearchWorker?

    
    @State private var showAlert = false
    @State private var isDataLoaded = false
    @State private var isShowingDept = false
    @State private var isShowingTeam = false
    @State private var textDept: String = ""
    @State private var textTeam: String = ""
    //@State private var selectedDate = Date()
    @State private var selectedDate = Calendar.current.date(byAdding: .month, value: 0, to: Date()) ?? Date()
    
    @State var state: Int  = 0;
    
    let colorwhiteblue = Color(red: 243/255, green: 248/255, blue: 255/255)
    let colordarkblue = Color(red: 0/255, green: 23/255, blue: 51/255)
    
    var body: some View {
        VStack (alignment:.leading,  spacing: 3)
        {
            Button(action: {
                isPresented = false
            }) {
                Text("< Back").frame(height: 10)
            }
            Spacer()
            
            Text(" 근태 조회").font(.pretendardBold24)
            
            Divider()
            
        
            HStack
            {
                VStack(alignment:.leading,  spacing: 3)
                {
                    HStack (spacing: 0)
                    {
                        Text(" 일자  : ").font(.pretendardBold14)
                        DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date).labelsHidden().font(.pretendardBold12)
                       Spacer()
                                      
                    }
                    HStack
                    {
                        Text(" 부서 :").font(.pretendardBold14)
                        TextField("", text: $textDept)
                                        .font(.pretendardBold14)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            isShowingDept = true
                        }) {
                            Image("iconsearch")
                                .padding(6)
                                .background(Color.blue)
                        }
                        .sheet(isPresented: $isShowingDept, content: {
                                PopUpDeptNo(isPresented: $isShowingDept , textDept: $textDept)})
                        
                       
                    }
                    HStack
                    {
                        Text(" 팀 :").font(.pretendardBold14)
                        
                        TextField("", text: $textTeam)
                                        .font(.pretendardBold14)
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            isShowingTeam = true
                        }) {
                            Image("iconsearch")
                                .padding(6)
                                .background(Color.blue)
                        }
                        .sheet(isPresented: $isShowingTeam, content: {
                            PopUpTeamNo(isPresented: $isShowingTeam , textTeam: $textTeam)})
                    }
                }
                Spacer()
                HStack
                {
                        Button(action: {
                            if textDept.isEmpty {
                               showAlert = true
                           } else {
                               var textReult : String = loadData(from: textDept, to: textTeam)
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
                        Button(action: {}) { Text("사번")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("성명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("출근")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("퇴근")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
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
                                List(modelsearchworkers, id: \.EMPNO) { modelsearchworker in
                                    HStack(alignment: .top) {
                                        let nullString = ""
                                        Text("\(modelsearchworker.EMPNO)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30 , alignment: .center)
                                        Text("\(modelsearchworker.EMPNM)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30 , alignment: .center)
                                        Text("\(modelsearchworker.STTIME ?? nullString)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30 , alignment: .center)
                                        Text("\(modelsearchworker.EDTIME ?? nullString)").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30 , alignment: .center)
                                    }
                                    .onTapGesture {
                                        selectedmodelsearchworker = modelsearchworker
                                      //  textSampel = selectedWorker!.EMPNO
                                    }
                                    
                                }.listStyle(.grouped)
                            }
                        }
                        .navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
            }
            
        }
      
    }
    
    private func dateToString(_ date: Date, format: String) -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = format
          return dateFormatter.string(from: date)
      }
    
    private func loadData(from textDept : String, to textTeam : String) -> String {
        isLoading = true
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/searchworking.jsp?projdate=\(dateToString(selectedDate, format: "yyyyMMdd"))&dept=\(textDept)&team=\(textTeam)") else {
            return "ERROR"
        }
        
        //

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
                
                    let decodedData = try JSONDecoder().decode([String: [ModelSearchWorker]].self, from: data)
                                    if let SearchWorkers = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelsearchworkers = SearchWorkers
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

struct WorkSearchWorker_Previews: PreviewProvider {
    static var previews: some View {
        WorkSearchWorker(isPresented: Binding.constant(false))
        //WorkSearchWorker()
    }
}
