//
//  Enemy.swift
//  FightGame
//
//  Created by Alex Kontis on 12/06/2016.
//  Copyright © 2016 Alex Kontis. All rights reserved.
//

import Foundation

class Creature: Character {    
    override init(hp: Int, attackPwr: Int, name: String) {
        super.init(hp: hp, attackPwr: attackPwr, name: name)
    }
}