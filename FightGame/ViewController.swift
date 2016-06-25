//
//  ViewController.swift
//  FightGame
//
//  Created by Alex Kontis on 09/06/2016.
//  Copyright © 2016 Alex Kontis. All rights reserved.
//

import UIKit
import AVFoundation

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
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        soldier = Soldier(hp: soldierRandomHP(), attackPwr: soldierRandomAP(), name: "Soldier")
        orc = Creature(hp: orcRandomHP(), attackPwr: orcRandomAP(), name: "Orc")
        newGame()
    }
    
    //MARK: Actions
    @IBAction func orcAttackBtnPress(sender: AnyObject) {
        let randAttack = orcRandomAP()
        if soldier.isAlive {
            soldier.attacked(randAttack)
            textLabel.text = "Orc hit Soldier for \(randAttack)"
            soldierHPLabel.text = "\(soldier.hp) HP"
            orcAttackBtn.enabled = false
            soldierAttackBtn.enabled = true
            playAudio("orc_attack")
            checkHP()
        }
        else {
            checkHP()
        }
    }
    
    @IBAction func soldierAttackBtnPress(sender: AnyObject) {
        let randAttack = soldierRandomAP()
        if orc.isAlive {
            orc.attacked(randAttack)
            textLabel.text = "Soldier hit Orc for \(randAttack)"
            orcHPLabel.text = "\(orc.hp) HP"
            soldierAttackBtn.enabled = false
            orcAttackBtn.enabled = true
            playAudio("soldier_attack")
            checkHP()
        }
        else {
            checkHP()
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
    func endGame(attacker: String, victim: String) {
        orcAttackBtn.enabled = false
        soldierAttackBtn.enabled = false
        restartLabel.hidden = false
        restartButton.hidden = false
        scoreLabel.text = "\(orcScore) - \(soldierScore)"
        textLabel.text = "\(attacker) killed \(victim) 💀"
    }
    
    func newGame() {
        soldier.hp = soldierRandomHP()
        soldier.attackPwr = soldierRandomAP()
        orc.hp = orcRandomHP()
        orc.attackPwr = orcRandomAP()
        setLabels()
        playAudio("horn")
    }
    
    func setLabels() {
        orcHPLabel.text = "\(orc.hp) HP"
        soldierHPLabel.text = "\(soldier.hp) HP"
        textLabel.text = "Begin game!"
    }
    
    func orcRandomHP() -> Int {
        let rand = Int(arc4random_uniform(50) + 1)
        return rand
    }
    
    func orcRandomAP() -> Int {
        let rand = Int(arc4random_uniform(15) + 1)
        return rand
    }

    func soldierRandomHP() -> Int {
        let rand = Int(arc4random_uniform(50) + 1)
        return rand
    }
    
    func soldierRandomAP() -> Int {
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
    
    func checkHP() {
        if soldier.isAlive == false {
            soldierHPLabel.text = "💀"
            orcScore += 1
            endGame("Orc", victim: "Soldier")
            playAudio("soldier_die")
        } else if orc.isAlive == false {
            orcHPLabel.text = "💀"
            soldierScore += 1
            endGame("Soldier", victim: "Orc")
            playAudio("orc_die")
        } else {
            print("No winner yet!")
        }
    }
    
    func playAudio(fileName: String) {
        let fileLocation = NSBundle.mainBundle().pathForResource("\(fileName)", ofType: "wav")
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
            player.play()
        }
        catch {
            // Something something
        }
    }
    
}