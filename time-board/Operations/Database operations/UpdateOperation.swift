//
//  UpdateOperation.swift
//  time-board
//
//  Created by Tianid on 25.05.2020.
//  Copyright © 2020 Tianid. All rights reserved.
//

import Foundation
import GRDB

class UpdateOperation: AsyncOperation {
    
    private let driver: DatabaseDriverProtocol
    private let sql: String
    private let sqlArguments: [String: DatabaseValueConvertible]
    
    init(driver: DatabaseDriverProtocol, sql: String, sqlArguments: [String: DatabaseValueConvertible]) {
        self.driver = driver
        self.sql = sql
        self.sqlArguments = sqlArguments
    }
    
    override func main() {
        updateRecordIntoTable { [unowned self] result in
            switch result {
            case .success():
                self.finish()
                TBLog(message: "Update operation ended", typeOfLog: .Info)
            case .failure(_):
                self.cancel()
            }
        }
    }
    
    private func updateRecordIntoTable(complition: (Result<Void, Error>) -> Void) {
        driver.updateRecordIntoTable(sql: sql, sqlArguments: sqlArguments, complition: complition)
    }
}
