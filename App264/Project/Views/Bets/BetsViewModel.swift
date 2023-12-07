//
//  BetsViewModel.swift
//  App264
//
//  Created by IGOR on 29/11/2023.
//

import SwiftUI
import CoreData

final class BetsViewModel: ObservableObject {
    
    @Published var bets: [BetsModel] = []
    
    @Published var sport: String = ""
    @Published var sports: [String] = ["Football", "Basketball", "Tennis", "Volleyball", "Hockey"]
    
    @Published var event: String = ""
    @Published var game: String = ""
    @Published var prediction: String = ""
    @Published var game_score: String = ""
    @Published var amount: String = ""
    @Published var coefficient: String = ""
    
    @Published var selectedHistoryBet: BetsModel? = nil
    
    func addBet(completion: @escaping () -> (Void)) {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "BetsModel", into: context) as! BetsModel
        
        trans.sport = sport
        trans.event = event
        trans.game = game
        trans.date = Date()
        trans.prediction = prediction
        trans.game_score = game_score
        trans.amount = Int16(amount) ?? 0
        trans.coefficient = Int16(coefficient) ?? 0

        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchBets() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<BetsModel>(entityName: "BetsModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.bets = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.bets = []
        }
    }
}
