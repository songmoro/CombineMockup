//
//  ContentView.swift
//  CombineMockup
//
//  Created by 송재훈 on 10/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.userList) { user in
                AsyncImage(url: URL(string: user.data.avatar))
                Text("name: \(user.data.firstName) \(user.data.lastName)")
                Text("email: \(user.data.email)")
                Text("support: \(user.support.text)")
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ContentView()
}
