//
//  DataModel.swift
//  task8
//
//  Created by Никита Чирухин on 20.03.2022.
//

import Foundation

struct DataModel {
    let teamName: String
    var isExpandable: Bool = false
    var teamLineUp: [String]
    var isFavorite: Bool
}

struct MyData {
    var teamData = [DataModel(teamName: "Chelsea",
                              teamLineUp:
                                ["Edouard Mendy",
                                "Marcos Alonso",
                                "Thiago Silva",
                                "Trevoh Chalobah",
                                "Hakim Ziyech",
                                "Romelu Lukaku"],
                              isFavorite: false),
                    DataModel(teamName: "Barcelona",
                              teamLineUp:
                                ["Marc-André ter Stegen",
                                 "Dani Alves",
                                 "Clément Lenglet",
                                 "Sergio Busquets",
                                 "Nico González",
                                 "Memphis Depay"],
                              isFavorite: false),
                    DataModel(teamName: "Zenit",
                              teamLineUp:
                                ["Stanislav Kritsyuk",
                                 "Dmitri Chistyakov",
                                 "Daler Kuzyayev",
                                 "Artem Dzyuba",
                                 "Ivan Sergeyev",
                                 "Andrei Mostovoy"],
                                isFavorite: false),
                    DataModel(teamName: "Lokomotiv", teamLineUp:
                                ["Dmitri Zhivoglyadov",
                                 "Maksim Nenakhov",
                                 "Daniil Khudyakov",
                                 "Stanislav Magkeyev",
                                 "Gyrano Kerk",
                                 "Sergei Babkin"],
                                isFavorite: false)]
}

