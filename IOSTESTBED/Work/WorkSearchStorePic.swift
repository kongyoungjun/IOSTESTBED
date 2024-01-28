
import SwiftUI

struct WorkSearchStorePic: View {
    
    // BACK 화면
    @Binding var isPresented: Bool
    //
    @State private var isLoading: Bool = false
    
    @State private var modelsearchstroepics: [ModelSearchStorePic] = []
    @State private var selectedmodelsearchstore: ModelSearchStorePic?

    
    @State private var isDataLoaded = false
    //@State private var isShowing = false
    @State private var isShowingProjNo = false
    @State private var textWareHouse: String = ""
    @State private var selectedDate = Date()
    @State var state: Int  = 0;
    
    
    
    let colorwhiteblue = Color(red: 243/255, green: 248/255, blue: 255/255)
    let colordarkblue = Color(red: 0/255, green: 23/255, blue: 51/255)
    
    
    @State private var selectedOption = 0
    
    let options = ["ALL","SPARE창고","대형1창고","대형2창고","통합외자창고","힘센1창고","힘센2창고"]
    
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
            
            Text(" 자재창고 담당자 관리").font(.pretendardBold24)
            
            Divider()
            
            
            HStack {
                Text(" 창고명 :").font(.pretendardBold18)
                
                Spacer()
                VStack
                {
                    Picker("검색조건", selection: $selectedOption) {
                        ForEach(0..<options.count) {
                            index in Text(options[index]).tag(index)
                        }
                    }
                    .frame(width:150, height:30)
                    .clipped()
                }
                Spacer()
                
                TextField("", text: $textWareHouse)
                                .font(.pretendardBold18)
                Button(action: {
                    var textReult : String = loadData(from: textWareHouse)
                }) {
                    Text("조회").font(.pretendardBold24)
                        .frame(height: 40)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
            }
        
            
           
                       
            Spacer()
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack{
                    HStack (alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Button(action: {}) { Text("창고명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.20), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("부서명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.20), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("성명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("사무실")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.15), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("전화번호")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.30), minHeight: 10, maxHeight: 30).background(Color.gray)
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
                                        Text("\(modelsearchstore.EMPNO)")
                                        Text("\(modelsearchstore.DEPTNM)")
                                        Text("\(modelsearchstore.MOBILE)")
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
    
    private func loadData(from textDept : String) -> String {
        isLoading = true
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/com/combo_store.jsp?userid=") else {
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


struct WorkSearchStorePic_Previews: PreviewProvider {
    static var previews: some View {
        WorkSearchStorePic(isPresented: Binding.constant(false))
    }
}
