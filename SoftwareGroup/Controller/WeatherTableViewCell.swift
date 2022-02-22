//
//  WeatherTableViewCell.swift
//  SoftwareGroup
//
//  Created by MAC on 22/02/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    var weather : WeatherModel? {
        didSet {
            //productImage.image = product?.productImage
            addressLabel.text = " Country :\(self.weather?.location?.country ?? "") \n City :\(self.weather?.location?.name ?? "") \n Current Date :\(self.weather?.location?.localtime ?? "")"
        
            /*
             self?.countryLabel.text = self?.weatherDetail?.location?.country
             self?.cityLabel.text = self?.weatherDetail?.location?.name
             self?.dateTimeLabel.text = self?.weatherDetail?.location?.localtime
             */
        }
    }
    
    private let addressLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0;
        return lbl
    }()
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addressLabel.heightAnchor.constraint(equalToConstant: 150),
            contentView.topAnchor.constraint(equalTo: addressLabel.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: addressLabel.trailingAnchor)
            ])
/*
        let horizontal = NSLayoutConstraint(item: addressLabel, attribute: .centerX, relatedBy: .equal, toItem: frame.size, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        
        let vertical = NSLayoutConstraint(item: addressLabel, attribute: .centerY, relatedBy: .equal, toItem: frame.size, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        
        let width = NSLayoutConstraint(item: addressLabel, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        let height = NSLayoutConstraint(item: addressLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)

        contentView.addConstraint(horizontal)
        contentView.addConstraint(vertical)
        contentView.addConstraint(width)
        contentView.addConstraint(height)
        */
       
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
