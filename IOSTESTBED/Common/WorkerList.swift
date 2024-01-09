

import SwiftUI


struct WorkerList: View {
    
    @State private var items = [SampleItem]() // Array to hold decoded items
    @State private var isDataLoaded = false
    @State private var isShowingPopup = false
    @State private var textInput: String = ""
    
    @State var state: Int  = 0;
    
    var body: some View {
        VStack
        {
            HStack
            {
                Text("TEST:")
                TextField("Enter text", text: $textInput)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()
                               .frame(width: 200)
            }
            
            
            Button("Load JSON Data") {
                loadData()
            }
            .padding()
            
            Button("Load Popup Data") {
                isShowingPopup.toggle()
            }
            .sheet(isPresented: $isShowingPopup, content: {
                WorkerListPopup(isPresented: $isShowingPopup, state: $state)
                                .frame(width: 300, height: 200) 
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
                        .navigationTitle("Custom List")
                    }
        }
       
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
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }
    }


struct WorkerList_Previews: PreviewProvider {
    static var previews: some View {
        WorkerList()
        //.environmentObject(ModelData())
    }
}
