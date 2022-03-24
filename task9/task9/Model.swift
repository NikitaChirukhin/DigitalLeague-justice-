//
//  Model.swift
//  task9
//
//  Created by Никита Чирухин on 24.03.2022.
//

import UIKit

struct DataModel {
    var pickViewModel = [PickViewModel(sex: "Man"),
                    PickViewModel(sex: "Woman"),
                    PickViewModel(sex: "Dog"),
                    PickViewModel(sex: "Attack helicopter")]
}

struct PickViewModel {
    var isPicked = false
    let sex: String
}
