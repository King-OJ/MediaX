//
//  FloatingTextField.swift
//  MediaX
//
//  Created by King OJ on 16/06/2024.
//

import SwiftUI

enum InputFields: Hashable {
    case name
    case username
    case email
    case password
}


struct FloatingTextField: View {
    let textFieldHeight: CGFloat = 50
    let placeHolderText: String
    var inputType: InputFields
    var icon: String?
    
    @State var value: String
    
    @FocusState private var focusedField: InputFields?
    
    var body: some View {
        ZStack(alignment: .leadingLastTextBaseline) {
            if inputType == .password {
                SecureField("", text: $value)
                    .padding(.top, 6)
                    .padding(.leading, 30)
                    .padding()
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(focusedField == inputType ? Color("primary500")
                                    :
                                        Color.gray, lineWidth: 1.0)
                    })
                    .zIndex(3.0)
                    .focused($focusedField, equals: .password)
                    
                
                    
                
                
                
                HStack() {
                    Image(systemName: icon ?? "")
                        .padding(.trailing,2)
                    
                    Text(placeHolderText)
                        .offset(x: value.isEmpty ?
                                    (focusedField == inputType ? -10 : 0)
                                :
                                    (focusedField == inputType ? -10 : -10)
                                ,
                                y: value.isEmpty ?
                                    (focusedField == inputType ? -30 : 0)
                                :
                                    (focusedField == inputType ? -30 : -30)
                        )
                        .scaleEffect(
                            value.isEmpty ?
                            (focusedField == inputType ? 0.7:  1.0)
                            :
                            (focusedField == inputType ? 0.7:  0.7)
                        )
                        .animation(.linear, value: focusedField)
                    
                }.padding(.leading)
                    .zIndex(1)
                
                
            }
            
            else {
                TextField("", text: $value) .padding(.top, 6)
                    .padding(.leading, 30)
                    .padding()
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(focusedField == inputType ? Color("primary500")
                                    :
                                        Color.gray
                                    , lineWidth: 1.0)
                    })
                    .textInputAutocapitalization(inputType == .email ? .never : .words)
                    .zIndex( 3.0)
                    .focused($focusedField, equals: withAnimation(.linear){
                        inputType
                    })
                
                
                HStack {
                    Image(systemName: icon ?? "")
                        .padding(.trailing, 2)
                    
                    Text(placeHolderText)
                        .offset(x: value.isEmpty ?
                                    (focusedField == inputType ? -10 : 0)
                                :
                                    (focusedField == inputType ? -10 : -10)
                                ,
                                y: value.isEmpty ?
                                    (focusedField == inputType ? -30 : 0)
                                :
                                    (focusedField == inputType ? -30 : -30)
                        )
                        .scaleEffect(
                            value.isEmpty ?
                            (focusedField == inputType ? 0.7:  1.0)
                            :
                            (focusedField == inputType ? 0.7:  0.7)
                        )
                }
                .padding(.leading)
                .animation(.linear, value: focusedField)
                .zIndex(1)
                
            }
   
        }
  
    }

}

#Preview {
    FloatingTextField(placeHolderText: "Email", inputType: .email , icon:"envelope" , value: "")
}
