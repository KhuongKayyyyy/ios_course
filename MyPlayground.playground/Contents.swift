struct Town{
    let name: String
    var citizens :[String]
    var resource :[String:Int]
    
    init(name: String, citizens: [String], resource: [String:Int]){
        self.name = name
        self.citizens = citizens
        self.resource = resource
    }
    func fortify(){
        print("Defend increased")
    }
}

var anotherTown = Town(name: "Nameless island", citizens: ["Khuong","Thanh"], resource: ["Coconuts":100])
anotherTown.citizens.append("Tom Hanks")
print(anotherTown.citizens)
var ghostTown = Town(name:"Ghost McGhostface",citizens: [],resource: ["TumbleWeed":1])
ghostTown.fortify()
print(ghostTown.name)
