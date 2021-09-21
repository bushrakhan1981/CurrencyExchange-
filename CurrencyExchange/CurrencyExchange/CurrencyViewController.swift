//
//  ViewController.swift
//  CurrencyExchange
//
//  Created by Bushra Khan on 9/19/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var convertTextField: UITextField!
    @IBOutlet weak var convertedCurrencyLabel: UILabel!
    
    var holder:[DataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CurrencyExchange.shared.getExchange(urlString: CurrencyUrl.baseUrl.rawValue) { data, error in
            self.holder = data ?? []
            for x in self.holder{
                self.currencyLabel.text = x.currency
                self.timeLabel.text = x.timestamp
                self.rateLabel.text = x.rate
            }
        }
    }
    
    @IBAction func convertButton(_ sender: Any) {
        let currencyHolder = holder
        
        for x in currencyHolder {
            if convertTextField.text == x.currency {
                convertedCurrencyLabel.text = x.rate
                
            }
        }
    }
    
}
       



