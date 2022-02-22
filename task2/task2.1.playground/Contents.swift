enum Clan {
    case orc
    case alliance
}

protocol Hero {
    
    var characteristics: Characteristics { get set }
    var clan: Clan { get set }
    
    func attack()
    func move()
    func stop()
    mutating func updateCharacteristics(_ characteristics: Characteristics, clan: Clan)
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
    
    mutating func updateCharacteristics(_ characteristics: Characteristics, clan: Clan) {
        self.characteristics = characteristics
        self.clan = clan
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
    
    init(armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float) {
        self.armor = armor
        self.attackPower = attackPower
        self.strength = strength
        self.agility = agility
        self.intelligence = intelligence
        self.hitPoints = hitPoints
        self.mana = mana
    }
}

class Archmage: Hero {
    
    var clan: Clan
    var characteristics: Characteristics
    
    func attack() {
        print("long-range attack")
    }
    
    init(characteristics: Characteristics, clan: Clan) {
        self.characteristics = characteristics
        self.clan = clan
    }
}

class BloodMage: Hero {
    
    var clan: Clan
    var characteristics: Characteristics
    
    func attack() {
        print("short-range attack")
    }
    
    init(characteristics: Characteristics, clan: Clan) {
        self.characteristics = characteristics
        self.clan = clan
    }
}

let bloodMageCharacteristics = Characteristics(armor: 10, attackPower: 10, strength: 10, agility: 10, intelligence: 10, hitPoints: 10, mana: 10)
let bloodMage = BloodMage(characteristics: bloodMageCharacteristics, clan: .alliance)

bloodMage.attack()
bloodMage.move()
bloodMage.stop()
