//
//  ViewController.swift
//  Exemplo Core Data
//
//  Created by Romildo Jozue Paiter on 4/18/16.
//  Copyright © 2016 Paiter App. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Criar um app delegate - Forma de acessar o datamodel
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        // Inserir um usuário no
//        do {
//            let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context)
//            newUser.setValue("romildo", forKey: "username")
//            newUser.setValue("secret", forKey: "password")
//            try context.save()
//        } catch {
//            print("Ocorreu um erro ao salvar o usuário")
//        }
        
        let request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        // NSPredicate - é utilizado para se fazer uma pesquisa dentro da base 
        // do core data
        request.predicate = NSPredicate(format: "username = %@", "romildo")
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0 {
                
                for result in results {
                    // print(result.valueForKey("username"))
                    
                    // Para objetos que não são criado dirtamente pelo coredata
                    if let username = result.valueForKey("username"){
                        print(username)
                    }
                    
                    // Verificano se o conteudo da variavel é nil
                    if let password = result.password! {
                        print(password)
                    }
                    
                }
                
            }
        } catch {
            print("Ocorreu um erro ao salvar o usuário")
        }

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

