import SwiftUI

struct UserInfo: Identifiable{
    let id = UUID()
    var profileImg: String = ""
    let isNew: Bool = false
    var username: String = ""
    var password: String = ""
    var nome: String = ""
    var cognome: String = ""
    var via: String = ""
    var citta: String = ""
    var eta: Int = 0
    
    var isAllMandatoryFiledsEmpty: Bool {
        return username.isEmpty || password.isEmpty
    }
    var isAnyMandatoryFiledsEmpty: Bool {
        return username.isEmpty && password.isEmpty && nome.isEmpty && cognome.isEmpty
    }
    mutating func emptyFileds() {
        nome = ""
        cognome = ""
    }
}
    
struct MyTextField: View {
    var withIcon: String
    @Binding var textValue: String
    var isMandatory: Bool = false
    var isSecret: Bool = false
    var textHint: String
    
    var body: some View {
    HStack {
        Image(systemName: withIcon)
        if isSecret {
            SecureField(textHint, text: $textValue)
        }
        else {
            TextField(textHint, text: $textValue)
        }
    }
    .padding()
    .overlay(RoundedRectangle(cornerRadius: 8)
    .stroke(isMandatory && textValue.isEmpty ? .red : .gray, lineWidth: 1))
    .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
    }
}

