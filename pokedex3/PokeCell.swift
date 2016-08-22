//
//  PokeCell.swift
//  pokedex3
//
//  Created by Andres Barrios on 8/20/16.
//  Copyright © 2016 Andres Barrios. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    
    var pokemon: Pokemon!
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell ( _ pokemon: Pokemon){
        self.pokemon = pokemon
        
        nameLable.text = self.pokemon.name.capitalized
        
        thumbImg.image = UIImage(named:"\(self.pokemon.pokedexID)")
    }
    
}
