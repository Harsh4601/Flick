//
//  CardSlider.swift
//  Interactions
//
//  Created by Harsh Londhekar on 30/09/21.
//

import UIKit
import CardSlider

struct Item: CardSliderItem{
    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
    
}

class CardSlider: UIViewController, CardSliderDataSource {
    
    var data = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        showVC()
        
        data.append(Item(image: UIImage(named: "1")!,
                         rating: nil,
                         title: "Golden Conure",
                         subtitle: "Queen of Bavaria Conure",
                         description: "Also known as the Queen of Bavaria Conure, the large, colorful, and striking Golden Conures are truly a sight to behold. But as too many of these birds have been captured from the wild, they have become endangered so they are increasingly hard to come by in the pet trade."))
        
        data.append(Item(image: UIImage(named: "2")!,
                         rating: nil,
                         title: "Victoria Crowned Pigeon",
                         subtitle: "Pigeon of lowland swamp forest",
                         description: "Blue-gray body and maroon chest. Differs from other crowned pigeons by its long white-tipped crest and pale gray wing patch tipped with maroon. Claps its wings very loudly when it takes off. Forages on the forest floor for fallen fruit."))
        
        data.append(Item(image: UIImage(named: "3")!,
                         rating: nil,
                         title: "Black Palm Cockatoo",
                         subtitle: "Also know as Goliath Cckatoo",
                         description: "A bird that is as equally impressive as it is uncommon, the Black Palm Cockatoo is an eye-catching species that originates, like all cockatoos, in Australia. These very large birds are highly intelligent, but they aren't known for being especially affectionate."))
        
    }
    
    func showVC(){
        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Exotic Birds 🕊"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }
    
    func numberOfItems() -> Int {
        return data.count
    }
    

}
