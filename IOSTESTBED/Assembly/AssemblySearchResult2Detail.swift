

import SwiftUI

struct AssemblySearchResult2Detail: View {
    @Binding var isPresented: Bool
    @Binding var textSelectProjno: String
    @Binding var textSelectSubProjno: String
    
    //@StateObject var userDataResult2Detail = UserData()
    
    @State private var modelresults: [ModelSearchResult2] = []
    @State private var selectedresult: ModelSearchResult2?
    @State private var isLoading: Bool = false
    
    @State private var textETC: String = ""
    
    let colorwhiteblue = Color(red: 243/255, green: 248/255, blue: 255/255)
    let colordarkblue = Color(red: 0/255, green: 23/255, blue: 51/255)
    
    init( isPresented: Binding<Bool> = .constant(false),
         textSelectProjno : Binding<String> = .constant(""),
         textSelectSubProjno : Binding<String> = .constant("")) {
        _isPresented = isPresented
        _textSelectProjno = textSelectProjno
        _textSelectSubProjno = textSelectSubProjno
    }
    
   // @Binding var bindingmodelworker: ModelWorker
    var body: some View {
        
        var textReult : String = loadData(gubun1: textSelectProjno, gubun2: textSelectSubProjno)
        
        VStack (alignment:.leading,  spacing: 3)
        {
            Button(action: {
                isPresented = false
            }) {
                Text("< Back")
            }.frame(height: 30)
            Spacer()
            HStack
            {
                Text(" 힘센작업실적변경").font(.pretendardBold24)
                Spacer()
                Button(action: {
                   // loadData()
                }) {
                    Text("저장").font(.pretendardBold24)
                }
                .padding()
                .frame(height: 30)
                .foregroundColor(.white)
                .background(Color.blue)
            }
            
            Divider()
            
            VStack{
                HStack (alignment:.center, spacing: 1)
                {
                    Spacer(minLength: 1)
                    Button(action: {}) { Text("구분")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: 100, minHeight: 10, maxHeight: 30).background(Color.gray)
                    Button(action: {}) { Text("구분")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: 50, minHeight: 10, maxHeight: 30).background(Color.gray)
                    Button(action: {}) { Text("계획")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  80, minHeight: 10, maxHeight: 30).background(Color.gray)
                    Button(action: {}) { Text("수정")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  80, minHeight: 10, maxHeight: 30).background(Color.gray)
                    Button(action: {}) { Text("실적")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  80, minHeight: 10, maxHeight: 30).background(Color.gray)
                    Button(action: {}) { Text("")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  20, minHeight: 10, maxHeight: 30).background(Color.gray)
                    Spacer(minLength: 1)

                }
              
            }
            .frame(width: .infinity, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack(spacing: 1)
                {
                    HStack(alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Text("비고").font(.pretendardBold12).foregroundColor(.blue).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.2), minHeight: 10, maxHeight: 30).background(colorwhiteblue)
                        TextField("", text: $textETC).font(.pretendardBold12).padding().frame(minWidth:0, maxWidth: (hstackwidth * 0.8), minHeight: 10, maxHeight: 30) .textFieldStyle(RoundedBorderTextFieldStyle())
                        
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
                        List(modelresults, id: \.GUBUN4) {
                            modelresult in
                            HStack(alignment: .top) {
                                let nullString = ""
                                let stdateString = modelresult.STDATE ?? nullString
                                let stprefixString = stdateString.prefix(10) 
                                let chgdateString = modelresult.CHGDATE ?? nullString
                                let chgprefixString = chgdateString.prefix(10)
                                let actdateString = modelresult.ACTDATE ?? nullString
                                let actprefixString = actdateString.prefix(10)
                                Text("\(modelresult.GUBUN4)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 100, minHeight: 10, maxHeight: 30 , alignment: .leading)
                                Text("\(modelresult.PROCNO ?? nullString)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 50, minHeight: 10, maxHeight: 30, alignment: .center)
                                Text("\(stprefixString)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30, alignment: .center)
                                Text("\(chgprefixString)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30, alignment: .center)
                                Text("\(actprefixString)").font(.pretendardBold10)
                                    .frame(minWidth:0, maxWidth: 80, minHeight: 10, maxHeight: 30, alignment: .center)
                                
                                Text("")
                                    .frame(minWidth:0, maxWidth: 20, minHeight: 10, maxHeight: 30, alignment: .center)
                                
                            }
                            .onTapGesture {
                                selectedresult = modelresult
                              //  textSampel = selectedWorker!.EMPNO
                            }
                            
                        }
                        .listStyle(.grouped)
                    }
                    
                    
                }.navigationBarHidden(true)
                .navigationBarTitle("", displayMode: .automatic)
    }
        }
        
    }
    
    private func loadData(gubun1 textSelectProjNo: String, gubun2 textSelectSubProjNo : String )-> String {
        isLoading = true
        
        
        guard let url = URL(string:
                                "https://m-engine.hhi.co.kr/mengine/testbed/searchresult1.jsp?user_id=\("")&gubun=&projno=\(textSelectProjNo)&subprojno=\(textSelectSubProjNo)"
        )
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
                
                    let decodedData = try JSONDecoder().decode([String: [ModelSearchResult2]].self, from: data)
                if let listship = decodedData["List"] {
                                        DispatchQueue.main.async {
                                            modelresults = listship
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

struct AssemblySearchResult2Detail_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchResult2Detail()
        
    }
}
