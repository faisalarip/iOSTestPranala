//
//  OnboardingViewController.swift
//  iOSTestPranala
//
//  Created by Tech Dev on 4/12/23.
//

import UIKit

class OnboardingViewController: UIViewController {
  
  @IBOutlet weak var btnGetStarted: UIButton!
  @IBOutlet weak var pageControlOnboarding: UIPageControl!
  @IBOutlet weak var imgOnboarding: UIImageView!
  @IBOutlet weak var lblHeadlingOnboarding: UILabel!
  @IBOutlet weak var lblSubHeadlingOnboarding: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
      setupLayout()
      registerListener()
    }
  
  private func setupLayout() {
    btnGetStarted.setTitleColor(.white, for: .normal)
    btnGetStarted.setTitle("GET STARTED", for: .normal)
    btnGetStarted.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    btnGetStarted.layer.cornerRadius = btnGetStarted.bounds.height/2
    btnGetStarted.backgroundColor = .green
  }
  
  private func registerListener() {
    btnGetStarted.addTarget(self, action: #selector(didTapGetStartedBtn(_:)), for: .touchUpInside)
  }
  
  @objc private func didTapGetStartedBtn(_ sender: UIButton) {
    let vc = HomeViewController()
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
