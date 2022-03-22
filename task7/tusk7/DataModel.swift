//
//  DataModel.swift
//  tusk7
//
//  Created by Никита Чирухин on 17.03.2022.
//

import Foundation

struct DataModel {
    
    let headerName: String
    let subType: [String]
    var isExpandable: Bool = false
    
    init(headerName: String, subType: [String], isExpandable: Bool) {
        self.headerName = headerName
        self.subType = subType
        self.isExpandable = isExpandable
    }
}

final class MyData {
    static var myData: [DataModel] = [DataModel(headerName: "Rock", subType: ["AC/DC", "Metallica", "Slipknot"], isExpandable: false),
                                    DataModel(headerName: "Pop", subType: ["Riana", "Pink", "Adele"], isExpandable: false),
                                    DataModel(headerName: "Rap", subType: ["50Cent", "Eminem", "Drake"], isExpandable: false)]
}
