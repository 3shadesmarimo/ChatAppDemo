//
//  MessageBubble.swift
//  ChatAppDemo
//
//  Created by Bilegt Davaa on 2022-02-25.
//

import SwiftUI

struct MessageBubble: View {
    var message : Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ?
                                Color("Grey") : Color("Peach"))
                    .cornerRadius(30)
            }
            .frame(width: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture{
                showTime.toggle()
            }
            if showTime{
                Text("\(message.timestap.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading
                             : .trailing, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
        
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", text: "I forgot how to walk, I learned to float", received: false, timestap: Date()))
    }
}
