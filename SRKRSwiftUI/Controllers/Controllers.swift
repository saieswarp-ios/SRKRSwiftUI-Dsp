import Foundation

final class AppController: ObservableObject {
    @Published var isLoggedIn = false
    @Published var loginMessage = ""

    func login(username: String, password: String) {
        guard !username.isEmpty, !password.isEmpty else {
            loginMessage = "Username Or password is incorrect."
            return
        }
        isLoggedIn = true
        loginMessage = ""
    }

    func logout() {
        isLoggedIn = false
    }

    func register(username: String, email: String, password: String, confirmation: String) -> Bool {
        !username.isEmpty && !email.isEmpty && !password.isEmpty && password == confirmation
    }
}

final class StudentController: ObservableObject {
    @Published var students: [Student] = [
        Student(id: 1, name: "Sample Student", department: "EEE", age: 20, gender: "M")
    ]

    func add(_ value: Student) {
        var item = value
        item.id = (students.map(\.id).max() ?? 0) + 1
        students.append(item)
    }

    func update(_ value: Student) {
        guard let i = students.firstIndex(where: {$0.id == value.id}) else { return }
        students[i] = value
    }

    func delete(_ value: Student) {
        students.removeAll { $0.id == value.id }
    }
}

final class CalculatorController: ObservableObject {
    @Published var first = ""
    @Published var second = ""
    @Published var result: Int?

    func multiply() {
        guard let a = Int(first), let b = Int(second) else { result = nil; return }
        result = a * b
    }
}
