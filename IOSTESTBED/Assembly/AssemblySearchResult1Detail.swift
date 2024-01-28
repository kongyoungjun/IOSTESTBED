//
//  AssemblySearchResult1Detail.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/28.
//

import SwiftUI

struct AssemblySearchResult1Detail: View {
    @Binding var isPresented: Bool
    @Binding var textProjno: String
    @Binding var textSubProjno: String
    @Binding var textProcno: String
    @State private var modelworkers: [ModelWorker] = []
    @State private var selectedWorker: ModelWorker?
    @State private var isLoading: Bool = false
    
    @State private var textETC: String = ""
    
    let colorwhiteblue = Color(red: 243/255, green: 248/255, blue: 255/255)
    let colordarkblue = Color(red: 0/255, green: 23/255, blue: 51/255)
    
    
   // @Binding var bindingmodelworker: ModelWorker
    var body: some View {
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
                Text(" 대형작업실적변경").font(.pretendardBold24)
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
            
            GeometryReader { geometry in
                let hstackwidth = geometry.size.width
                VStack{
                    HStack (alignment:.center, spacing: 1)
                    {
                        Spacer(minLength: 1)
                        Button(action: {}) { Text("호선번호")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth: (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("공사번호")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("타입")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Button(action: {}) { Text("공시일")}.foregroundColor(.white).font(.pretendardBold14).frame(minWidth:0, maxWidth:  (hstackwidth * 0.25), minHeight: 10, maxHeight: 30).background(Color.gray)
                        Spacer(minLength: 1)

                    }
                  
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
                                List(modelworkers, id: \.EMPNO) { modelworkers in
                                    HStack(alignment: .top) {
                                        Text("\(modelworkers.EMPNO)")
                                        Text("\(modelworkers.DEPTNM)")
                                        Text("\(modelworkers.MOBILE)")
                                    }
                                    .onTapGesture {
                                        selectedWorker = modelworkers
                                      //  textSampel = selectedWorker!.EMPNO
                                    }
                                    
                                }
                            }
                            
                            
                        }.navigationBarHidden(true)
                        .navigationBarTitle("", displayMode: .automatic)
            }
        }
        
    }
}

struct AssemblySearchResult1Detail_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchResult1Detail(isPresented: .constant(false)
                                    ,textProjno: .constant("")
                                    ,textSubProjno: .constant("")
                                    ,textProcno: .constant("")
                                    //, bindingmodelworker: .constant(ModelWorker(PARTNM: "", EMPNM: "", GRDNM: "", MOBILE: "", TELNO: "", CHK: "", DEPTNM: "", EMPNO: "", TEAM: "", DEPT: ""))
                                    //,textSubProjno: Binding.constant("")
                                    //,textProcno: Binding.constant("")
                                    //,bindingmodelworker: <#Binding<ModelWorker>#>
                        )
    }
}
