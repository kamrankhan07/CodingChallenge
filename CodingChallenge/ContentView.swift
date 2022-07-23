//
//  ContentView.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 22/7/22.
//

import SwiftUI

enum Tabs: String, CaseIterable, Equatable {
    case myPost = "My Posts"
    case allPosts = "All Posts"
}

struct ContentView: View {
    
    @ObservedObject var userManager = UserManager.shared
    @State private var selectedTab: Tabs = .myPost
    @State private var allTabs = Tabs.allCases
    @State private var showNewPostView = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                VStack {
                    HStack(spacing: 5) {
                        ForEach($allTabs, id: \.self) { t in
                            let type = t.wrappedValue
                            Button {
                                selectedTab = type
                            } label: {
                                VStack(spacing: 5) {
                                    Text(type.rawValue)
                                        .fontWeight(.bold)
                                        .font(.title2)
                                        .foregroundColor(Color.text)
                                    
                                    Rectangle()
                                        .fill((type == selectedTab) ? Color.tabSelection : Color.clear)
                                        .frame(width: 115, height: 5)
                                        .clipShape(Capsule())
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 0)
                    
                    switch(selectedTab) {
                    case .myPost:
                        MyPosts()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .allPosts:
                        AllPostsView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                
                GeometryReader { geometry in
                    Button {
                        showNewPostView = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, Color.addNewPost)
                            .frame(width: 50, height: 50)
                    }
                    .position(x: geometry.size.width - 45, y: geometry.size.height - 45)
                    .zIndex(.infinity)
                    .fullScreenCover(isPresented: $showNewPostView) {
                        NewPostView()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Menu {
                    Picker("Users", selection: self.$userManager.selectedUser) {
                        ForEach(userManager.users, id: \.self) { user in
                            Text(user.name).foregroundColor(Color.text).tag(user as User?)
                        }
                    }
                } label: {
                    HStack(alignment: .center, spacing: 5) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon)
                            .frame(width: 15, height: 15, alignment: .center)
                        Text("\(userManager.selectedUser.name)")
                            .foregroundColor(Color.text)
                            .bold()
                        Image(systemName: "arrowtriangle.down.fill")
                            .resizable()
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.blue)
                            .frame(width: 12, height: 12, alignment: .center)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
