//
//  AnimalModel.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import Foundation
 
struct animal {
    var name : String
    var image : String
}
class animalsModel {
    let animals = [animal(name: "Alligator", image: "Alligator"),
                   animal(name: "Anteater", image: "Anteater"),
                   animal(name: "Armadillo", image: "Armadillo"),
                   animal(name: "Axolotl", image: "Auroch"),
                   animal(name: "Badger", image: "Badger"),
                   animal(name: "Bat", image: "Bat"),
                   animal(name: "Beaver", image: "Beaver"),
                   animal(name: "Buffalo", image: "Buffalo"),
                   animal(name: "Camel", image: "Camel"),
                   animal(name: "Capybara", image: "Capybara"),
                   animal(name: "Chameleon", image: "Chameleon"),
                   animal(name: "Cheetah", image: "Cheetah"),
                   animal(name: "Chinchilla", image: "Chinchilla"),
                   animal(name: "Chipmunk", image: "Chipmunk"),
                   animal(name: "Chupacabra", image: "Chupacabra"),
                   animal(name: "Cormorant", image: "Cormorant"),
                   animal(name: "Coyote", image: "Coyote"),
                   animal(name: "Crow", image: "Crow"),
                   animal(name: "Dingo", image: "Dingo"),
                   animal(name: "Dinosaur", image: "Dinosaur"),
                   animal(name: "Dolphin", image: "Dolphin"),
                   animal(name: "Duck", image: "Duck"),
                   animal(name: "Elephant", image: "Elephant"),
                   animal(name: "Ferret", image: "Ferret"),
                   animal(name: "Fox", image: "Fox"),
                   animal(name: "Frog", image: "Frog"),
                   animal(name: "Giraffe", image: "Giraffe"),
                   animal(name: "Gopher", image: "Gopher"),
                   animal(name: "Grizzly", image: "Grizzly"),
                   animal(name: "Hedgehog", image: "Hedgehog"),
                   animal(name: "Hippo", image: "Hippo"),
                   animal(name: "Hyena", image: "Hyena"),
                   animal(name: "Ibex", image: "Ibex"),
                   animal(name: "Ifrit", image: "Ifrit"),
    ]
    func numberOfRowsInSection(section: Int) -> Int {
        return animals.count
    }

    func cellForRowAt(indexPath: IndexPath) -> animal {
        return animals[indexPath.row]
    }
}
