//
//  Cadastro.swift
//  FranciscoPessoas
//
//  Created by IFPB on 16/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import Foundation

class Cadastro {
    var lista: Array<Pessoa>
    
    init() {
        self.lista = Array()
    }
    
    func add(pessoa: Pessoa) {
        self.lista.append(pessoa)
    }
    
    func count() -> Int {
        return self.lista.count
    }
    
    func get() -> Array<Pessoa> {
        return self.lista
    }
    
    func get(index: Int) -> Pessoa {
        return self.lista[index]
    }
    
    func del(index: Int) {
        self.lista.remove(at: index)
    }
    
    func mov(inicio: Int, fim: Int) {
        let movedElement = self.lista.remove(at: inicio)
        self.lista.insert(movedElement, at: fim)
    }
}
