import Foundation

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
