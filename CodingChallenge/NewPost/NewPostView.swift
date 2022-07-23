//
//  NewPostView.swift
//  CodingChallenge
//
//  Created by Kamran Khan on 21/7/22.
//

import SwiftUI

struct NewPostView: View {
    
    @ObservedObject var postStorage = PostStorageManager.shared
    @ObservedObject var userManager = UserManager.shared
    @Environment(\.presentationMode) var presentationMode
    @State private var postButtonDisabled: Bool = true
    @State private var text: String = "Post text..."
    @State private var placeholderText: String = "Post text..."
    @State private var showMediaPicker: Bool = false
    @State private var image: UIImage?
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                VStack (spacing: 20) {
                    ZStack {
                        TextEditor(text: $text)
                            .padding(5)
                            .background(Color.clear)
                            .foregroundColor((text == placeholderText) ? .gray : Color.text)
                            .font(.body)
                            .onTapGesture {
                                if self.text == placeholderText {
                                    self.text = ""
                                }
                            }
                            .onChange(of: text) { newValue in
                                postButtonDisabled = newValue.isEmpty
                            }
                    }
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .frame(maxHeight: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.borderColor, lineWidth: 0.5)
                    )
                    .padding(.top, 10)
                    
                    Button {
                        showMediaPicker = true
                    } label: {
                        Text("Select Picture")
                    }
                    .sheet(isPresented: $showMediaPicker) {
                        MediaPicker(image: $image)
                           
                    }
                    
                    if let image = self.image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let post = Post(user: userManager.selectedUser, text: self.text, timeStamp: Date(), image: image)
                        postStorage.addNewPost(post: post)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Post")
                            .frame(width: 70, height: 30, alignment: .center)
                            .foregroundColor(.white)
                            .background(postButtonDisabled ? Color.gray : Color.blue)
                            .cornerRadius(5)
                    }
                    .disabled(postButtonDisabled)
                }
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewPostView()
            NewPostView()
                .preferredColorScheme(.dark)
        }
    }
}

