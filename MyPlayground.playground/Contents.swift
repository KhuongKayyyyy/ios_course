func fetchUserID(from server: String) async -> Int{
    if server == "primary"{
        return 97
    }
    return 501
}
func fecthUserName(from server: String) async ->String{
    let userID = await fetchUserID(from: server)
    if userID == 501{
        return "Khuong"
    }
    return "Guest"
}
func connectUser(to server: String) async{
    async let userID = fetchUserID(from: server)
    async let userName = fetchUserID(from: server)
    let greeting = await"Hello \(userName) with userID\(userID)"
    print(greeting)
}


Task{
    await connectUser(to:"primary")
}
