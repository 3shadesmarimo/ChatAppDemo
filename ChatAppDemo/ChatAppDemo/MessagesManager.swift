//
//  MessagesManager.swift
//  ChatAppDemo
//
//  Created by Bilegt Davaa on 2022-02-25.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager : ObservableObject{
    @Published private (set) var messages: [Message] = []
    @Published private (set) var lastMessageId = ""
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener{querySnapshot, error in
                                                      guard let documents = querySnapshot?.documents else{
            print ("Error fetching documents: \(String(describing: error))")
            return
        }
        self.messages = documents.compactMap{document -> Message? in
            do{
                return try document.data(as: Message.self)
            } catch {
            print("Error docoding documents into Message: \(error)") 
            return nil
        }
            }
            
        self.messages.sort{$0.timestap < $1.timestap }
            
        }
    }
    
    func sendMessage(text: String){
        do{
            let newMessage = Message (id: "\(UUID())", text: text, received: false, timestap: Date())
            try db.collection("messages").document().setData(from: newMessage)
        }
        catch{
            print("Error adding message to FireStore: \(error)")
        }
    }
}
