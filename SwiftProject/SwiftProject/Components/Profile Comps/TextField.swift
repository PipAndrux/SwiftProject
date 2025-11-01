import SwiftUI

struct MyTextField: View {
    var withIcon: String
    @Binding var textValue: String
    var isMandatory: Bool = false
    var isSecret: Bool = false
    var textHint: String
    
    var isError: Bool? = nil

    private var borderColor: Color {
        if isError == true {
            return .red
        }
        if isMandatory && textValue.isEmpty {
            return .red
        }
        return .gray
    }
    
    var body: some View {
        HStack {
            Image(systemName: withIcon)
            if isSecret {
                SecureField(textHint, text: $textValue)
                    .textContentType(.newPassword)
                    .autocorrectionDisabled(true)
            }
            else {
                TextField(textHint, text: $textValue)
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 8)
        .stroke(borderColor, lineWidth: 1))
        .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var testUsername = ""
        @State var testPassword = ""
        @State var testConfirm = "wrong"
        
        var body: some View {
            VStack {
                MyTextField(
                    withIcon: "person.fill",
                    textValue: $testUsername,
                    isMandatory: true,
                    textHint: "Username"
                )
                MyTextField(
                    withIcon: "lock.fill",
                    textValue: $testPassword,
                    isMandatory: true,
                    isSecret: true,
                    textHint: "Password"
                )
                MyTextField(
                    withIcon: "lock.shield.fill",
                    textValue: $testConfirm,
                    isMandatory: true,
                    isSecret: true,
                    textHint: "Confirm Password",
                    isError: testPassword != testConfirm
                )
            }
            .padding()
        }
    }
    return PreviewWrapper()
}
