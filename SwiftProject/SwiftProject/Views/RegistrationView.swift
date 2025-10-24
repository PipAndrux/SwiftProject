import SwiftUI

struct RegistrationView: View{
    @State var userValue = UserInfo()
    var body: some View {
        VStack {
            VStack{
                Image(systemName: "globe")
                Text("Login")
            }
            
            MyTextField(withIcon: "person.fill", textValue: $userValue.nome, textHint: "Nome")
            MyTextField(withIcon: "person.fill", textValue: $userValue.cognome, textHint: "Cognome")
            MyTextField(withIcon: "person.fill", textValue: $userValue.username,
            isMandatory: true, textHint: "username")
            MyTextField(withIcon: "key.fill", textValue: $userValue.password,
            isMandatory: true, isSecret: true, textHint: "password")
            
            HStack(spacing: 50) {
                Button("Login") {
                //WebService to call
                }.foregroundColor(.purple)
                .disabled(userValue.isAllMandatoryFiledsEmpty)
                        
                Button("Pulisci") {
                userValue.emptyFileds()
                }.foregroundColor(.green)
                .disabled(userValue.isAnyMandatoryFiledsEmpty)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
