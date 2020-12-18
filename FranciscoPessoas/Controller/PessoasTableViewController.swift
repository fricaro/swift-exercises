//
//  PessoasTableViewController.swift
//  FranciscoPessoas
//
//  Created by IFPB on 17/12/20.
//  Copyright © 2020 IFPB. All rights reserved.
//

import UIKit

class PessoasTableViewController: UITableViewController {

    var cadastro = Cadastro()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(self.cadastro.get())
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cadastro.count()
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pessoa = self.cadastro.get(index: indexPath.row)
        cell.textLabel?.text = pessoa.nome
        cell.detailTextLabel?.text = String(pessoa.idade)
        return cell
    }
   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.cadastro.del(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        self.cadastro.mov(inicio: fromIndexPath.row, fim: to.row)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "pessoas_cadastro"){
            let fvc = segue.destination as! FormViewController
            fvc.cadastro = self.cadastro
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let fvc = self.storyboard?.instantiateViewController(identifier: "form") as! FormViewController
      fvc.pessoa = self.cadastro.get(index: indexPath.row)
      self.navigationController?.pushViewController(fvc, animated: true)
    }
    
}
	
