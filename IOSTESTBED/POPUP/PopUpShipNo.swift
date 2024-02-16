
import SwiftUI

struct PopUpShipNo: View {
    @Binding var isPresented: Bool
    @Binding var state: Int
    @Binding var textInput: String
    
    //@StateObject var userData = UserData()
    
    @State private var modelpopupships: [ModelPopupShip] = []
    @State private var selectedship: ModelPopupShip?
    
    @State private var showAlert = false
    
    @State private var selectedOption = 0
    @State private var textSelect: String = ""
    @State private var textValue: String = ""
    @State private var isLoading: Bool = false
    
    let options = ["호선번호","공사번호","공사명"]
    
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
            Text(" 호선번호조회").font(.pretendardBold24)
            
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
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.allCharacters)
                Button(action: {
                    if textValue.isEmpty {
                       showAlert = true
                   } else {
                       var textReult : String = loadData(from: selectedOption, to: textValue)
                   }
                }) {
                    Image("iconsearch")
                        .padding(6)
                        .background(Color.blue)
                }
            }
            .alert(isPresented: $showAlert) {
               Alert(
                   title: Text("Alert"),
                   message: Text("검색조건을 넣어주세요"),
                   dismissButton: .default(Text("OK"))
               )
            }
            
            GeometryReader { geometry in
                
                HStack (alignment:.center, spacing: 1)
                {
                    let hstackwidth = geometry.size.width
                    
                    Spacer(minLength: 1)
                    Button(action: {}) { Text("호선번호")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(Color.gray)
                    Button(action: {}) { Text("공사번호")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.3), minHeight: 10, maxHeight: 30).background(Color.gray)
                    Button(action: {}) { Text("공사명")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.5), minHeight: 10, maxHeight: 30).background(Color.gray)
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
                                List(modelpopupships , id: \.COLM2)
                                {
                                    modelship in
                                    HStack(alignment: .top) {
                                        Text("\(String(describing: modelship.COLM1))").font(.pretendardBold12)
                                            .frame(minWidth:0, maxWidth: 50, minHeight: 10, maxHeight: 30 , alignment: .center)
                                            .onTapGesture {
                                                textInput = modelship.COLM1
                                                isPresented = false
                                            }
                                        Text("\(String(describing: modelship.COLM2))").font(.pretendardBold12) .frame(minWidth:0, maxWidth: 100, minHeight: 10, maxHeight: 30 , alignment: .center)
                                            .onTapGesture {
                                            textInput = modelship.COLM1
                                            isPresented = false
                                        }
                                        Text("\(String(describing: modelship.COLM3))").font(.pretendardBold12) .frame(minWidth:0, maxWidth: 150, minHeight: 10, maxHeight: 30 , alignment: .center)
                                            .onTapGesture {
                                            textInput = modelship.COLM1
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
    
    private func loadData(from selectInt : Int, to textShip : String) -> String {
        //print("nav")
        isLoading = true
        
        if selectInt == 0 {
            textSelect = "B"
        }
        else if selectInt == 1{
            textSelect = "A"
        }
        else{
            textSelect = "C"
        }
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/com/combo_projno.jsp?userid=\("")&COM_GUBUN=SHIP_01&COM_DATA1=\(textSelect)&COM_DATA2=\(textShip)&COM_DATA3=&COM_DATA4=") else {
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
                
                    let decodedData = try JSONDecoder().decode([String: [ModelPopupShip]].self, from: data)
                    if let workerPopupShip = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelpopupships = workerPopupShip
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

struct PopUpShipNo_Previews: PreviewProvider {
    static var previews: some View {
        PopUpShipNo(isPresented: Binding.constant(false), state: Binding.constant(0), textInput: Binding.constant(""))
        
       // PopUpShipNo(isPresented: Binding.constant(false))
    }
}
