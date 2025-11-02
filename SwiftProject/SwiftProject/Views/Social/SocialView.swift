import SwiftUI

private enum SocialTab {
    case following
    case activity
    case findUsers
}

struct SocialView: View {
    
    @State private var selectedTab: SocialTab = .following
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            
            Picker("Social Tab", selection: $selectedTab) {
                Text("Following").tag(SocialTab.following)
                Text("Activity").tag(SocialTab.activity)
                Text("Find Users").tag(SocialTab.findUsers)
            }
            .pickerStyle(.segmented)
            .padding()
            
            if selectedTab == .findUsers {
                searchBarView
            }
            
            switch selectedTab {
            case .following:
                FollowingView()
            case .activity:
                ActivityView()
            case .findUsers:
                FindUsersView(searchText: $searchText)
            }
            
            Spacer()
        }
        .navigationTitle("Social")
    }
    
    private var searchBarView: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search for users...", text: $searchText)
                .foregroundColor(.primary)
                .textFieldStyle(.plain)
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(12)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

#Preview {
    NavigationStack {
        SocialView()
    }
}
