var petName: String?
petName = "Scooter 🐢"
print(petName)

if petName != nil {
    print("My friend's pet is \(petName)")
} else {
    print("My friend doesn't have a pet 😞")
}

if let petName = petName {
    print("My friend's pet is \(petName)")
}

if let friendsPet = petName {
    print("My friend's pet is \(friendsPet)")
    print("petName is still an Optional! \(petName)")
}



//Another thing to note: When unwrapping Optionals, you don't need to have an else branch in your if statement. If the Optional is nil and you didn't write an else branch, nothing will happen. Sometimes you want to do nothing, and sometimes you want to do something different if the Optional is nil. Either way, Swift forces you to deal with nil values.