import SwiftUI

struct LoginView: View {
    
    @State private var userInfo = UserInfo()
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(spacing: 16) {
            
            Spacer()
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 20)
            
            Text("Welcome Back!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Log in to continue exploring.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 20)
            
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
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.horizontal, 10)
            }
            
            Button(action: {
                loginUser()
            }) {
                Text("Log In")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 10)
            .disabled(userInfo.isAllMandatoryFiledsEmpty)
            
            
            HStack {
                Button("Forgot Password?") {
                }
                .font(.footnote)
                
                Spacer()
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)

            Spacer()
            Spacer()
        }
        .padding()
        .navigationTitle("Log In")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func loginUser() {
        if userInfo.isAllMandatoryFiledsEmpty {
            errorMessage = "Username and Password are required."
            return
        }
        
        print("Login ATTEMPTED with: \(userInfo.username) / \(userInfo.password)")
        
        errorMessage = nil
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
