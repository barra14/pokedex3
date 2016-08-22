//
//  Pokemon.swift
//  pokedex3
//
//  Created by Andres Barrios on 8/20/16.
//  Copyright © 2016 Andres Barrios. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name : String!
    private var _pokedexID : Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
    var nextEvolutionTxt: String{
        if _nextEvolutionTxt == nil {
            _nextEvolutionTxt = ""
        }
        
        return _nextEvolutionTxt
    }
    
    var attack : String{
        if _attack == nil{
            _attack = ""
    }
        return _attack
    }
    
    var weight : String {
        if _weight == nil{
            _weight = ""
    }
        return _weight
    }
    
    var height : String{
        if _height == nil{
            _height = ""
    }
        return _height
    }
    
    var defense : String {
        if _defense == nil{
            _defense = ""
    }
        return _defense
    }
    
    var type: String{
        if _type == nil{
            _type = ""
    }
        return _type
    }
    
    var description : String{
        if _description == nil{
            _description = ""
    }
        return _description
    }
    
    var name : String{
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name : String , pokedexID : Int){
        self._name = name
        self._pokedexID = pokedexID
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexID)/"
        
    }
    
    func downloadPokemonDetail( completed: DownloadComplete){
        
        Alamofire.request( _pokemonURL, withMethod: .get).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject>{
            
            if let weight = dict["weight"] as? String{
                self._weight = weight
            }
            
            if let height = dict["height"] as? String{
                self._height = height
                
            }
            
            if let attack = dict["attack"] as? Int{
                self._attack =  "\(attack)"
            }
            
            if let defense = dict["defense"] as? Int{
                self._defense = "\(defense)"
                }
                
                
            }
            
            completed()
        }
    }
}
