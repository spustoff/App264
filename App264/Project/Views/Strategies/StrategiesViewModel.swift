//
//  StrategiesViewModel.swift
//  App264
//
//  Created by IGOR on 29/11/2023.
//

import SwiftUI
import CoreData

final class StrategiesViewModel: ObservableObject {
    
    @Published var strategies: [StrategiesModel] = []
    
    @Published var name: String = ""
    @Published var abb: String = ""
    @Published var text: String = ""
    
    func addStrategy(completion: @escaping () -> (Void)) {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "StrategiesModel", into: context) as! StrategiesModel

        trans.name = name
        trans.abb = abb
        trans.text = text

        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchStrategies() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<StrategiesModel>(entityName: "StrategiesModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.strategies = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.strategies = []
        }
    }
}
