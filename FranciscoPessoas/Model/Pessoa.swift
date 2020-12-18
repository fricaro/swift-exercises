//
//  Pessoa.swift
//  FranciscoPessoas
//
//  Created by IFPB on 16/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import Foundation

class Pessoa: NSObject {
    var nome: String
    var idade: Int
    
    override var description: String{
        return "\(self.nome) - \(self.idade)"
    }
    
    init(nome: String, idade: Int){
        self.nome = nome
        self.idade = idade
    }
}
