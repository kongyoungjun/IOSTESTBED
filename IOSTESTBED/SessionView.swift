//
//  SessionView.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/07.
//

import SwiftUI

struct SessionView: View {
    @Binding var userId : String
        @Binding var roomNo : String
        
        var body: some View {
            VStack {
                Text("SessionView Page입니다.")
                Text("사용자 아이디 : \\(userId)   \\n 방 번호 : \\(roomNo) ")
                    .frame(width: 300, height: 200)
            }
        }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
          SessionView(userId: Binding.constant("Preview userId"), roomNo: Binding.constant("Preview roomNo"))
      }
}
