//
//  ViewController.swift
//  coffeeShopApp
//
//  Created by Mariam Joglidze on 25.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var coffeeImage: UIImageView!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var subTitle: UILabel!
    @IBOutlet private weak var rating: UILabel!
    @IBOutlet private weak var descriptionLbl: UILabel!
    @IBOutlet private weak var price: UILabel!
    @IBOutlet private weak var sizeSButton: UIButton!
    @IBOutlet private weak var sizeMButton: UIButton!
    @IBOutlet private weak var sizeLButton: UIButton!
    @IBOutlet private weak var priceView: UIView!
    
    private let model: Model = .init(
        image: UIImage(named: "coffee")!,
        title: "Cappucino",
        subTitle: "with Chocolate",
        rating: "4.8(230)",
        description: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coffeeImage.image = model.image
        titleLbl?.text = model.title
        subTitle.text = model.subTitle
        rating.text = model.rating
        descriptionLbl.text = model.description
        priceView.dropShadow()
        sizeSButton.layer.borderColor = UIColor(hexString: "#DEDEDE").cgColor
        sizeSButton.layer.borderWidth = 1
        sizeMButton.layer.borderColor = UIColor(hexString: "#C67C4E").cgColor
        sizeMButton.layer.borderWidth = 1
        sizeLButton.layer.borderColor = UIColor(hexString: "#DEDEDE").cgColor
        sizeLButton.layer.borderWidth = 1
    }
}

struct Model {
    let image: UIImage
    let title: String
    let subTitle: String
    let rating: String
    let description: String
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 0.2
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
