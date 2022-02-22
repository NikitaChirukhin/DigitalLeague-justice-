protocol Hero {
    
    var characteristics: Characteristics { get set }
    
    func attack()
    func move()
    func stop()
    mutating func updateCharacteristics(_ characteristics: Characteristics)
}

extension Hero {
    
    func attack() {
        print("attack")
    }

    func move() {
        print("move")
    }

    func stop() {
        print("stop")
    }
    
    mutating func updateCharacteristics(_ characteristics: Characteristics) {
        self.characteristics = characteristics
    }
}

struct Characteristics {
    
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?
    
    init(characteristics: Characteristics) {
        self.armor = characteristics.armor
        self.attackPower = characteristics.attackPower
        self.strength = characteristics.strength
        self.agility = characteristics.agility
        self.intelligence = characteristics.intelligence
        self.hitPoints = characteristics.hitPoints
        self.mana = characteristics.mana
    }
}

class Archmage: Hero {

    var characteristics: Characteristics
    
    func attack() {
        print("long-range attack")
    }
    
    init(characteristics: Characteristics) {
        self.characteristics = characteristics
    }
}

class Knight: Hero {

    
    var characteristics: Characteristics
    
    func attack() {
        print("melee attack")
    }
    
    init(characteristics: Characteristics) {
        self.characteristics = characteristics
    }
}
