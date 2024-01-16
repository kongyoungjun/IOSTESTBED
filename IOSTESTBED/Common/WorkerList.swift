

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
    
    @State private var items = [SampleItem]() // Array to hold decoded items
    @State private var isDataLoaded = false
    @State private var isShowingPopup = false
    @State private var textInput: String = ""
    
    
    @State private var textSampel: String = ""
    
    @State var state: Int  = 0;
    @Binding var isPresented: Bool
    
    @State private var isBigEngine: Bool = true
    
    @State private var selectedFromDate = Date()
    @State private var selectedToDate = Date()
    
    
    var body: some View {
        VStack (alignment:.leading,  spacing: 3)
        {
            Button(action: {
                isPresented = false
            }) {
                Text("< Back").frame(height: 10)
            }
            Spacer()
            
            Text(" 호선정보조회").font(.pretendardBold28)
            
            Divider()
            
            HStack(alignment:.center,  spacing: 0){
                   Spacer()
                   Button(action: {
                    isBigEngine = true
                   }) {
                       Text("대형").font(.pretendardBold18)
                           .frame(width: 70, height: 10)
                           .padding()
                           .foregroundColor(.white)
                           .background(isBigEngine ? Color.blue : Color.gray)
                   }
                    Button(action: {
                        isBigEngine = false
                    }) {
                        Text("힘센").font(.pretendardBold18)
                            .frame(width: 70, height: 10)
                            .padding()
                            .foregroundColor(.white)
                            .background(isBigEngine ? Color.gray : Color.blue)
                    }
                  Spacer()
                
                            Button(action: {
                                loadData()
                            }) {
                                Text("Load JSON ")
                                    .frame(height: 10)
                            }
            }
            

            HStack
            {
                Text("TEST:").font(.pretendardBold18)
                TextField("Enter text", text: $textInput)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()
                               .frame(width: 200)
            }
            HStack
            {
                DatePicker(selection: $selectedFromDate, in: ...Date(), displayedComponents: .date) {
                            Text("날짜를 선택하세요")
                        }


            }
            
            
            
            Button("Load Popup Data") {
                isShowingPopup.toggle()
            }
            .sheet(isPresented: $isShowingPopup, content: {
                WorkerListPopup(isPresented: $isShowingPopup, state: $state)
                                //.frame(width: 300, height: 100)
                        })
            
            NavigationView {
                        VStack {
                            List(items) { item in
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                       // .navigationTitle("Custom List")
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
    
    private func loadData() {
            // Fetch and decode JSON data
            if let fileURL = Bundle.main.url(forResource: "data", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: fileURL)
                    let decodedItems = try JSONDecoder().decode([SampleItem].self, from: data)
                    self.items = decodedItems
                    isDataLoaded = true
                } catch {
                   // print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }
    }



struct WorkerList_Previews: PreviewProvider {
    static var previews: some View {
        WorkerList(isPresented: Binding.constant(false))
        //.environmentObject(ModelData())
    }
}
