////: Playground - noun: a place where people can play
//
import Cocoa
//
//class Character {
//    var _hp: Int!
//    var _attackPwr: Int!
//    var _name: String!
//    
//    init(hp: Int, attackPwr: Int, name: String) {
//        self._hp = hp
//        self._attackPwr = attackPwr
//        self._name = name
//    }
//    
//}
//
//class Soldier: Character {
//    var hp: Int {
//        get {
//            return super._hp
//        }
//    }
//    
//    var attackPwr: Int {
//        get {
//            return super._attackPwr
//        }
//    }
//    
//    var name: String {
//        get {
//            return super._name
//        }
//    }
//    
//    override init(hp: Int, attackPwr: Int, name: String) {
//        super.init(hp: hp, attackPwr: attackPwr, name: name)
//    }
//    
//}
//
//var sldr = Soldier(hp: 100, attackPwr: 10, name: "Soldier")


    func randHP() -> Int {
        let rand = Int(arc4random_uniform(50))
        return rand
    }

var num = randHP()

print(num)

