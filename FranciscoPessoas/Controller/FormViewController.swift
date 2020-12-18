//
//  ViewController.swift
//  FranciscoPessoas
//
//  Created by IFPB on 16/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfIdade: UITextField!
    var cadastro: Cadastro?
    var pessoa: Pessoa?
    @IBAction func btnSave(_ sender: Any) {
        let nome = self.tfNome.text
        let idade = Int(self.tfIdade.text!)
        let pessoa = Pessoa(nome: nome!, idade: idade!)
        self.cadastro?.add(pessoa: pessoa)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfNome.text = pessoa?.nome
        self.tfIdade.text = "\(String(describing: pessoa?.idade))"
    }


}

