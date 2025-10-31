import SwiftUI

struct RegistrationView: View {
    
    @State private var userInfo = UserInfo()
    @State private var confirmPassword = ""
    @State private var errorMessage: String?
    
    @FocusState private var focusedField: Field?
    enum Field {
        case password, confirmPassword
    }

    private var passwordError: String? {
        guard !userInfo.password.isEmpty && !confirmPassword.isEmpty else {
            return nil
        }
        
        if userInfo.password != confirmPassword {
            return "Passwords do not match."
        }
        
        if userInfo.password.count < 8 {
            return "Password must be at least 8 characters long."
        }
        
        return nil
    }

    private var isRegisterDisabled: Bool {
        return userInfo.username.isEmpty ||
               userInfo.password.isEmpty ||
               confirmPassword.isEmpty ||
               passwordError != nil
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                
                Spacer()
                
                Image(systemName: "person.crop.circle.badge.plus")
                    .font(.system(size: 60))
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 10)
                
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Start your adventure.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
                
                MyTextField(
                    withIcon: "person.fill",
                    textValue: $userInfo.username,
                    isMandatory: true,
                    textHint: "Username"
                )
                
                MyTextField(
                    withIcon: "lock.fill",
                    textValue: $userInfo.password,
                    isMandatory: true,
                    isSecret: true,
                    textHint: "Password"
                )
                .focused($focusedField, equals: .password)
                
                MyTextField(
                    withIcon: "lock.shield.fill",
                    textValue: $confirmPassword,
                    isMandatory: true,
                    isSecret: true,
                    textHint: "Confirm Password",
                    isError: passwordError != nil
                )
                .focused($focusedField, equals: .confirmPassword)
                
                if let passwordError = passwordError {
                    Text(passwordError)
                        .foregroundColor(.red)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 10)
                }

                Divider().padding(.horizontal, 10).padding(.vertical, 2)
                
                MyTextField(
                    withIcon: "person.text.rectangle.fill",
                    textValue: $userInfo.nome,
                    textHint: "First Name (optional)"
                )
                
                MyTextField(
                    withIcon: "person.text.rectangle.fill",
                    textValue: $userInfo.cognome,
                    textHint: "Last Name (optional)"
                )

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal, 10)
                }
                
                Button(action: {
                    registerUser()
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 10)
                .padding(.top, 5)
                .disabled(isRegisterDisabled)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Sign Up")
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                focusedField = nil
            }
        }
    }
    
    private func registerUser() {
        errorMessage = nil
        print("Registration ATTEMPTED with: \(userInfo.username)")
    }
}

#Preview {
    NavigationStack {
        RegistrationView()
    }
}
