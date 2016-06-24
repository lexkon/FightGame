//
//  Character.swift
//  FightGame
//
//  Created by Alex Kontis on 12/06/2016.
//  Copyright © 2016 Alex Kontis. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int!
    private var _attackPwr: Int!
    private var _name: String!

    // Computed properties
    var hp: Int {
        get {
            return _hp
        } set {
            return _hp = newValue
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        } set {
            return _attackPwr = newValue
        }
    }
    
    var name: String {
        get {
            return _name
        } set {
            return _name = newValue
        }
    }
    
    var isAlive: Bool {
        if self.hp <= 0 {
            return false
        }
        else {
            return true
        }
    }
    
    init(hp: Int, attackPwr: Int, name: String) {
        self._hp = hp
        self._attackPwr = attackPwr
        self._name = name
    }
    
    func attacked(attackPwr: Int) -> Bool {
        self.hp -= attackPwr
        
        return true
    }
    
}