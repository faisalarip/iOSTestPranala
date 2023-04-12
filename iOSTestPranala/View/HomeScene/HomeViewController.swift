//
//  HomeViewController.swift
//  iOSTestPranala
//
//  Created by Tech Dev on 4/12/23.
//

import UIKit


class HomeViewController: UIViewController {
  
  @IBOutlet weak var btnGeneratePrimeNumber: UIButton!
  @IBOutlet weak var txtInputNumber: UITextField!
  @IBOutlet weak var lblPrimeNumber: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupLayout()
    registerListener()
  }
  
  private func setupLayout() {
    btnGeneratePrimeNumber.setTitleColor(.white, for: .normal)
    btnGeneratePrimeNumber.setTitle("GENERATE BILANGAN PRIMA", for: .normal)
    btnGeneratePrimeNumber.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    btnGeneratePrimeNumber.layer.cornerRadius = btnGeneratePrimeNumber.bounds.height/2
    btnGeneratePrimeNumber.backgroundColor = .green
  }
  
  private func registerListener() {
    btnGeneratePrimeNumber.addTarget(self, action: #selector(didTapGeneratePrimeNumber(_:)), for: .touchUpInside)
  }
  
  @objc private func didTapGeneratePrimeNumber(_ sender: UIButton) {
    let numberText = Int(txtInputNumber.text ?? "0") ?? 0
    let valuesPrimeNumber = generatePrimeNumber(rangeNumber: numberText)
    let valuesString: [String] = valuesPrimeNumber.map { String($0) }
    
    lblPrimeNumber.text = "A prime number of \(numberText) are \n \(valuesString.joined(separator: "\n "))"
    
    self.view.endEditing(true)
  }
  
  private func isPrimeNumber(number: Int) -> Bool {
    
    if number == 1 || number == 0 {
      return false
    }
    
    for value in 2..<number {
      if (number % value) == 0 {
        return false
      }
    }
    
    return true
  }
  
  private func generatePrimeNumber(rangeNumber: Int) -> [Int] {
    var values: [Int] = []
    if rangeNumber < 1 {
      return []
    }
    
    for n in 1...rangeNumber {
      if isPrimeNumber(number: n) {
        values.append(n)
      }
    }
    
    return values
  }

}
