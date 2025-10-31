import SwiftUI

struct SettingsProfileView: View {
    
    let isLogged: Bool
    
    let commonSettings: [SettingItem] = [
        SettingItem(title: "Get help", iconName: "questionmark.circle"),
        SettingItem(title: "Privacy", iconName: "lock.shield"),
    ]
    
    let userSetting = SettingItem(title: "Account settings", iconName: "person.crop.circle")
    let logoutSetting = SettingItem(title: "Log out", iconName: "arrow.right.square")
    
    let loginSetting = SettingItem(title: "Log in", iconName: "arrow.left.square")
    let registerSetting = SettingItem(title: "Sign Up", iconName: "person.badge.plus")
    
    var body: some View {
        Form {
            Section {
                if isLogged {
                    NavigationLink(destination: Text("Account Settings View")) {
                        SettingRow(item: userSetting)
                    }
                    .listRowSeparator(.hidden)
                }
                
                ForEach(commonSettings) { item in
                    NavigationLink(destination: Text("Placeholder View")) {
                        SettingRow(item: item)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            
            Section {
                if isLogged {
                    Button(action: {
                        // TODO: Logout logic
                    }) {
                        SettingRow(item: logoutSetting, color: .red)
                    }
                    .listRowSeparator(.hidden)
                } else {
                    NavigationLink(destination: LoginView()) {
                        SettingRow(item: loginSetting, color: .blue)
                    }
                    .listRowSeparator(.hidden)
                    
                    NavigationLink(destination: RegistrationView()) {
                        SettingRow(item: registerSetting, color: .green)
                    }
                    .listRowSeparator(.hidden)
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

struct SettingRow: View {
    var item: SettingItem
    var color: Color = .primary
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: item.iconName)
                .font(.system(size: 24))
                .frame(width: 30)
            Text(item.title)
        }
        .foregroundColor(color)
    }
}
