//
//  ViewController.swift
//  FranciscoArrocha
//
//  Created by IFPB on 12/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbStartValue: UILabel!
    @IBOutlet weak var lbEndValue: UILabel!
    @IBOutlet weak var lbFinishValue: UILabel!
    @IBOutlet weak var tfValueOutlet: UITextField!
    var valorGerado : Int = 0
    var game : Bool = true
    
    @IBAction func btnPlay(_ sender: Any) {
        if self.game {
            let bounderiesValid = validateBounderies()
            if bounderiesValid {
                let arrochado = validateArrochado()
                if arrochado {
                    self.lbFinishValue.text = "VENCEU"
                    self.game = false
                } else {
                    calculateNewBounderies()
                }
            } else {
                self.lbFinishValue.text = "PERDEU"
                self.game = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbStartValue.text = "1"
        self.lbEndValue.text = "100"
        self.valorGerado = Int.random(in: (2)..<(100))
    }
    
    func calculateNewBounderies() {
        if Int(self.tfValueOutlet.text!)! > self.valorGerado {
            self.lbEndValue.text = self.tfValueOutlet.text
        } else if Int(self.tfValueOutlet.text!)! < self.valorGerado {
            self.lbStartValue.text = self.tfValueOutlet.text
        }
    }
    
    func validateArrochado() -> Bool {
        return (Int(self.lbStartValue.text!)! + 2) == Int(self.lbEndValue.text!)
    }
    
    func validateBounderies() -> Bool {
        if Int(self.tfValueOutlet.text!)! == Int(self.lbStartValue.text!) { return false }
        if Int(self.tfValueOutlet.text!)! == Int(self.lbEndValue.text!) { return false }
        if Int(self.tfValueOutlet.text!)! == self.valorGerado { return false }
        return true
    }
}

