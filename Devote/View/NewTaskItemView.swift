//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Ezequiel Rasgido on 27/09/2021.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: PROPERTIES - Section
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var task = ""
    
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        self.task.isEmpty
    }
    
    // MARK: FUNCTION - Section
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = self.task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            self.task = ""
            self.hideKeyboard()
            self.isShowing = false
        }
    }
    
    // MARK: BODY - Section
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        self.isDarkMode ?
                        Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                
                Button(action: {
                    self.addItem()
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                }) {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .disabled(self.isButtonDisabled)
                .onTapGesture {
                    if self.isButtonDisabled {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(self.isButtonDisabled ? Color.blue : Color.pink)
                .cornerRadius(10)
            } //: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                self.isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .cornerRadius(16)
            .shadow(
                color: Color(red: 0, green: 0, blue: 0, opacity: 0.65),
                radius: 24
            )
            .frame(maxWidth: 640)
        } //: VSTACK
        .padding()
    }
}

// MARK: PREVIEW - Section
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .previewLayout(.device)
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
