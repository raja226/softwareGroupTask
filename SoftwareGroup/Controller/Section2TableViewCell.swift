//
//  Section2TableViewCell.swift
//  SoftwareGroup
//
//  Created by MAC on 22/02/22.
//

import UIKit

class Section2TableViewCell: UITableViewCell {

    private let sectionLabel : UILabel = {
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
        contentView.addSubview(sectionLabel)
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sectionLabel.heightAnchor.constraint(equalToConstant: 150),
            contentView.topAnchor.constraint(equalTo: sectionLabel.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: sectionLabel.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: sectionLabel.trailingAnchor)
            ])

       
    }
    func setWeatherDetail(_ foreCastData: ForecastdaytModel?) {
        self.sectionLabel.text = " Max: " + "\(foreCastData?.day?.maxtemp_c ?? 0.0) \n Min:  \(foreCastData?.day?.mintemp_c ?? 0.0) \n Date:  \(foreCastData?.date ?? "") \n \(foreCastData?.day?.condition?.text ?? "")"
    
        if let value  = foreCastData?.day?.condition?.icon {
            let urlstring = "https:" + value
            let url = URL(string: urlstring)!
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageView?.image = UIImage(data: data)
                    }
                }
            }
        }
   
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
