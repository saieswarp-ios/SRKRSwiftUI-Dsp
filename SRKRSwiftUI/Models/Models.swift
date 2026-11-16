import Foundation

struct Student: Identifiable, Codable, Equatable {
    var id: Int
    var name: String
    var department: String
    var age: Int
    var gender: String
    var contact: String = ""
    var address: String = ""
    
    //dspdspdspdsp
}

struct BlogPost: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let imageName: String
    let summary: String
}

struct PortfolioItem: Identifiable {
    let id = UUID()
    let imageName: String
}

struct WorkStep: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
}

struct TeamMember: Identifiable {
    let id = UUID()
    let name: String
    let role: String
    let imageName: String
}

struct ClientLogo: Identifiable {
    let id = UUID()
    let imageName: String
}

struct Comment: Identifiable {
    let id = UUID()
    let name: String
    let date: String
    let text: String
    let imageName: String
}
