//
//  ViewController.swift
//  FightGame
//
//  Created by Alex Kontis on 09/06/2016.
//  Copyright © 2016 Alex Kontis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var orcAttackBtn: UIButton!
    @IBOutlet weak var soldierAttackBtn: UIButton!
    @IBOutlet weak var restartLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var orcHPLabel: UILabel!
    @IBOutlet weak var soldierHPLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: Variables
    var soldier = Soldier!(nil)
    var orc = Creature!(nil)
    var orcScore = 0
    var soldierScore = 0
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        soldier = Soldier(hp: soldierrandomHP(), attackPwr: soldierrandomAP(), name: "Soldier")
        orc = Creature(hp: orcrandomHP(), attackPwr: orcrandomAP(), name: "Orc")
        orcHPLabel.text = "\(orc.hp) HP"
        soldierHPLabel.text = "\(soldier.hp) HP"
    }
    
    //MARK: Actions
    @IBAction func orcAttackBtnPress(sender: AnyObject) {
        let randAttack = orcrandomAP()
        if soldier.isAlive {
            orc.attemptAttack(randAttack)
            textLabel.text = "Orc hit Soldier for \(randAttack)"
            soldierHPLabel.text = "\(soldier.hp) HP"
            orcAttackBtn.enabled = false
            soldierAttackBtn.enabled = true
        }
        else {
            textLabel.text = "Orc killed Soldier💀"
            soldierHPLabel.text = "💀"
            orcScore += 1
            endGame()
        }
    }
    
    @IBAction func soldierAttackBtnPress(sender: AnyObject) {
        let randAttack = soldierrandomAP()
        if orc.isAlive {
            soldier.attemptAttack(randAttack)
            textLabel.text = "Soldier hit Orc for \(randAttack)"
            orcHPLabel.text = "\(orc.hp) HP"
            soldierAttackBtn.enabled = false
            orcAttackBtn.enabled = true
        }
        else {
            textLabel.text = "Soldier killed Orc 💀"
            orcHPLabel.text = "💀"
            soldierScore += 1
            endGame()
        }
    }
    
    @IBAction func restartBtn(sender: AnyObject) {
        orcAttackBtn.enabled = true
        soldierAttackBtn.enabled = true
        restartLabel.hidden = true
        restartButton.hidden = true
        newGame()
    }
    
    
    //MARK: Functions
    func endGame() {
        orcAttackBtn.enabled = false
        soldierAttackBtn.enabled = false
        restartLabel.hidden = false
        restartButton.hidden = false
        scoreLabel.text = "\(orcScore) - \(soldierScore)"
    }
    
    func newGame() {
        soldier.hp = soldierrandomHP()
        soldier.attackPwr = soldierrandomAP()
        orc.hp = orcrandomHP()
        orc.attackPwr = orcrandomAP()
        setLabels()
    }
    
    func setLabels() {
        orcHPLabel.text = "\(orc.hp) HP"
        soldierHPLabel.text = "\(soldier.hp) HP"
        textLabel.text = "Begin game!"
    }
    
    func orcrandomHP() -> Int {
        let rand = Int(arc4random_uniform(50) + 1)
        return rand
    }
    
    func orcrandomAP() -> Int {
        let rand = Int(arc4random_uniform(15) + 1)
        return rand
    }
    
    func soldierrandomHP() -> Int {
        let rand = Int(arc4random_uniform(50) + 1)
        return rand
    }
    
    func soldierrandomAP() -> Int {
        let rand = Int(arc4random_uniform(15) + 1)
        return rand
    }
    
    func disableOrcAttack() {
        orcAttackBtn.enabled = false
        soldierAttackBtn.enabled = true
    }
    
    func disableSoldierAttack() {
        soldierAttackBtn.enabled = false
        orcAttackBtn.enabled = true
    }
    
}