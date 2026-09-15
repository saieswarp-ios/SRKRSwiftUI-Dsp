import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var app: AppController
    @State private var username = ""; @State private var password = ""
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.themeBlue, Color.themeGreen], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack(spacing: 18) {
                Image(systemName: "person.crop.circle.fill").font(.system(size: 70)).foregroundStyle(.white)
                Text("LOGIN").font(.system(size: 28, weight: .bold)).foregroundStyle(.white)
                TextField("Username...", text: $username).textInputAutocapitalization(.never).padding().background(.white).clipShape(RoundedRectangle(cornerRadius: 14))
                SecureField("Password...", text: $password).padding().background(.white).clipShape(RoundedRectangle(cornerRadius: 14))
                Button("Login") { app.login(username: username, password: password) }.font(.headline).foregroundStyle(.white).frame(maxWidth: .infinity).frame(height: 52).background(Color.themeBlue).clipShape(RoundedRectangle(cornerRadius: 14))
                if !app.loginMessage.isEmpty { Text(app.loginMessage).foregroundStyle(.white) }
                NavigationLink("Don't have an account? Sign Up") { RegisterView() }.foregroundStyle(.white)
            }.padding(24).frame(maxWidth: 430)
        }.navigationBarBackButtonHidden(true)
    }
}

struct RegisterView: View {
    @EnvironmentObject private var app: AppController
    @Environment(\.dismiss) private var dismiss
    @State private var username = ""; @State private var email = ""; @State private var password = ""; @State private var confirmation = ""; @State private var message = ""
    var body: some View {
        Form {
            Section("REGISTER ACCOUNT") {
                TextField("Username..", text: $username)
                TextField("Email..", text: $email).keyboardType(.emailAddress)
                SecureField("Enter password...", text: $password)
                SecureField("Re-enter Password...", text: $confirmation)
            }
            Button("Register Account") {
                message = app.register(username: username, email: email, password: password, confirmation: confirmation) ? "Your Account has been created for \(username)" : "Please check the registration fields."
            }
            if !message.isEmpty { Text(message).foregroundStyle(message.hasPrefix("Your") ? Color.themeGreen : Color.themeRed) }
            Button("Already have an account? Login") { dismiss() }.foregroundStyle(Color.themeBlue)
        }.navigationTitle("Register")
    }
}

struct MoreView: View {
    @EnvironmentObject private var app: AppController
    var body: some View {
        List {
            Section("Authentication") {
                Button { app.logout() } label: { Label("Logout", systemImage: "rectangle.portrait.and.arrow.right") }.foregroundStyle(Color.themeRed)
            }
            Section("Original Django Pages") {
                NavigationLink("Products") { SimplePage(title: "Products", text: "This is my prodcts page.") }
                NavigationLink("Service") { SimplePage(title: "Service", text: "This is my serivce page.") }
                NavigationLink("About us") { SimplePage(title: "About us", text: "This is my aboutus page.") }
                NavigationLink("Contact us") { SimplePage(title: "Contact us", text: "This is my Contactus page.") }
                NavigationLink("Students") { StudentListView() }
                NavigationLink("Student registration") { StudentRegistrationView() }
                NavigationLink("Student form / FBV") { StudentFormView() }
                NavigationLink("GET / POST") { CalculatorView() }
                NavigationLink("Update / Delete") {
                    NavigationStack {
                        StudentListWithActionsView()
                    }
                }
            }
        }.navigationTitle("More")
    }
}

struct SimplePage: View {
    let title: String; let text: String
    var body: some View { VStack(spacing: 18) { AppHeader(title: title, subtitle: "Original page"); Text(text).font(.title3).padding(); Spacer() }.background(Color(.systemGroupedBackground)).navigationBarTitleDisplayMode(.inline) }
}

struct StudentListView: View {
    @StateObject private var controller = StudentController()
    var body: some View {
        List(controller.students) { student in
            NavigationLink { StudentDetailView(student: student) } label: {
                VStack(alignment: .leading) { Text(student.name).font(.headline); Text("Roll.No: \(student.id) • \(student.department)").font(.caption).foregroundStyle(.secondary) }
            }.swipeActions { Button(role: .destructive) { controller.delete(student) } label: { Label("Delete", systemImage: "trash") } }
        }.navigationTitle("Students").toolbar { NavigationLink { StudentRegistrationView() } label: { Image(systemName: "plus") } }
    }
}

struct StudentDetailView: View {
    let student: Student
    var body: some View {
        Form {
            LabeledContent("Roll.No", value: "\(student.id)")
            LabeledContent("Name", value: student.name)
            LabeledContent("Age", value: "\(student.age)")
            LabeledContent("Gender", value: student.gender)
            LabeledContent("Department", value: student.department)
            LabeledContent("Phone number", value: student.contact)
            LabeledContent("Address", value: student.address)
        }.navigationTitle("Details")
    }
}

struct StudentRegistrationView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var controller = StudentController()
    @State private var name = ""; @State private var department = ""; @State private var age = ""; @State private var gender = ""
    var body: some View {
        Form {
            Section("Enroll or Register The student Details here.") {
                TextField("Name", text: $name); TextField("Department", text: $department); TextField("Age", text: $age).keyboardType(.numberPad); TextField("Gender", text: $gender)
            }
            Button("Submit") {
                controller.add(Student(id: 0, name: name, department: department, age: Int(age) ?? 0, gender: gender))
                dismiss()
            }
        }.navigationTitle("Student Registration")
    }
}

struct CalculatorView: View {
    @StateObject private var controller = CalculatorController()
    var body: some View {
        Form {
            Section("GET request") {
                TextField("Enter the first number", text: $controller.first).keyboardType(.numberPad)
                TextField("Enter the second number", text: $controller.second).keyboardType(.numberPad)
                Button("Submit GET") { controller.multiply() }
            }
            Section("POST request") { Button("Submit POST") { controller.multiply() } }
            if let result = controller.result { Section { Text("Result is : \(result)").font(.title2.bold()).foregroundStyle(Color.themeGreen) } }
        }.navigationTitle("GET & POST")
    }
}
struct StudentFormView: View {
    @StateObject private var controller = StudentController()
    @State private var name = ""
    @State private var department = ""
    @State private var age = ""
    @State private var gender = ""

    var body: some View {
        Form {
            Section("Today we are going to discuss on FBV - Function based views.") {
                Text("For registration please fill in the form.")
            }
            Section("Student") {
                TextField("Name", text: $name)
                TextField("Age", text: $age).keyboardType(.numberPad)
                TextField("Gender", text: $gender)
                TextField("Department", text: $department)
            }
            Button("Submit") {
                controller.add(
                    Student(
                        id: 0,
                        name: name,
                        department: department,
                        age: Int(age) ?? 0,
                        gender: gender
                    )
                )
            }
        }
        .navigationTitle("Student Form")
    }
}

struct StudentUpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var controller = StudentController()
    @State private var student: Student

    init(student: Student) {
        _student = State(initialValue: student)
    }

    var body: some View {
        Form {
            Section("Do you want to Update this item?") {
                LabeledContent("Roll.No", value: "\(student.id)")
                TextField("Name", text: $student.name)
                TextField("Department", text: $student.department)
                TextField("Phone number", text: $student.contact)
                TextField("Address", text: $student.address)
                TextField("Age", value: $student.age, format: .number)
                TextField("Gender", text: $student.gender)
            }
            Button("Yes, Update") {
                controller.update(student)
                dismiss()
            }
            Button("Cancel", role: .cancel) {
                dismiss()
            }
        }
        .navigationTitle("Update Student")
    }
}

struct StudentDeleteView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var controller = StudentController()
    let student: Student

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "trash.circle.fill")
                .font(.system(size: 64))
                .foregroundStyle(Color.themeRed)

            Text("Are you want to delete this item?")
                .font(.title3.bold())

            VStack(alignment: .leading, spacing: 8) {
                Text("Roll.No: \(student.id)")
                Text("Name: \(student.name)")
                Text("Department: \(student.department)")
                Text("Gender: \(student.gender)")
                Text("Age: \(student.age)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.themeRed.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            Button("Yes, Delete", role: .destructive) {
                controller.delete(student)
                dismiss()
            }
            .buttonStyle(.borderedProminent)

            Button("Cancel") {
                dismiss()
            }
        }
        .padding(24)
        .navigationTitle("Delete Student")
    }
}
struct StudentListWithActionsView: View {
    @StateObject private var controller = StudentController()

    var body: some View {
        List(controller.students) { student in
            VStack(alignment: .leading, spacing: 8) {
                Text(student.name).font(.headline)
                Text("Roll.No: \(student.id) • \(student.department)")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                HStack {
                    NavigationLink("Update") {
                        StudentUpdateView(student: student)
                    }
                    .foregroundStyle(Color.themeBlue)

                    Spacer()

                    NavigationLink("Delete") {
                        StudentDeleteView(student: student)
                    }
                    .foregroundStyle(Color.themeRed)
                }
                .font(.caption.bold())
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Update / Delete")
    }
}
