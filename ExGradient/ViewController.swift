//
//  ViewController.swift
//  ExGradient
//
//  Created by Jake.K on 2022/04/07.
//

import UIKit

class ViewController: UIViewController {
  private lazy var infoLabel: UILabel = {
    let label = UILabel()
    label.text = "CAGradientLayer 예제"
    label.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(label)
    return label
  }()
  private lazy var axialGradient: CAGradientLayer = {
    let gradient = CAGradientLayer()
    gradient.type = .axial // default
    gradient.colors = [
      UIColor.systemGreen.cgColor,
      UIColor.systemBlue.cgColor,
      UIColor.systemYellow.cgColor
    ]
    gradient.locations = [0, 0.5, 1] // gradient stop 지점
    // (0,0)이 좌측 상단, (1,1)이 우측 하단
    gradient.startPoint = CGPoint(x: 0, y: 0.5)
    gradient.endPoint = CGPoint(x: 1, y: 0.5)
    return gradient
  }()
  private lazy var radialGradient: CAGradientLayer = {
    let gradient = CAGradientLayer()
    gradient.type = .radial
    gradient.colors = [
      UIColor.systemGreen.cgColor,
      UIColor.systemBlue.cgColor,
      UIColor.systemYellow.cgColor
    ]
    gradient.locations = [0, 0.5, 1]
    
    // (0,0)이 원의 중심, (1,1)이 원의 테두리
    gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
    gradient.endPoint = CGPoint(x: 1, y: 1)
    return gradient
  }()
  private lazy var conicGradient: CAGradientLayer = {
    let gradient = CAGradientLayer()
    gradient.type = .conic
    gradient.colors = [
      UIColor.systemGreen.cgColor,
      UIColor.systemBlue.cgColor,
      UIColor.systemYellow.cgColor
    ]
    gradient.locations = [0, 0.5, 1]
    
    // startPoint: 원의 중심, endPoint: 첫 번째 색상과 마지막 색상이 결합되는 지점
    // (0,0)이 좌측 상단, (1,1)이 우측 하단
    gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
    gradient.endPoint = CGPoint(x: 1, y: 1)
    return gradient
  }()
  private lazy var axialView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray
    view.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(view)
    return view
  }()
  private lazy var radialView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray
    view.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(view)
    return view
  }()
  private lazy var conicView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray
    view.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(view)
    return view
  }()
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 16
    stackView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(stackView)
    [
      self.axialView,
      self.radialView,
      self.conicView
    ].forEach { stackView.addArrangedSubview($0) }
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NSLayoutConstraint.activate([
      self.infoLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
      self.infoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
    
    NSLayoutConstraint.activate([
      self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
      self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.stackView.widthAnchor.constraint(equalToConstant: 300),
      self.stackView.heightAnchor.constraint(equalToConstant: 700),
    ])
    
    self.axialView.layer.addSublayer(self.axialGradient)
    self.radialView.layer.addSublayer(self.radialGradient)
    self.conicView.layer.addSublayer(self.conicGradient)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.axialGradient.frame = self.axialView.bounds
    self.radialGradient.frame = self.radialView.bounds
    self.conicGradient.frame = self.conicView.bounds
    
    let label = UILabel()
    label.text = "axial (linear)"
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    self.axialView.addSubview(label)
    NSLayoutConstraint.activate([
      label.centerYAnchor.constraint(equalTo: self.axialView.centerYAnchor),
      label.centerXAnchor.constraint(equalTo: self.axialView.centerXAnchor),
    ])
    
    let label2 = UILabel()
    label2.text = "radial (circle)"
    label2.textColor = .white
    label2.translatesAutoresizingMaskIntoConstraints = false
    self.radialView.addSubview(label2)
    NSLayoutConstraint.activate([
      label2.centerYAnchor.constraint(equalTo: self.radialView.centerYAnchor),
      label2.centerXAnchor.constraint(equalTo: self.radialView.centerXAnchor),
    ])
    
    let label3 = UILabel()
    label3.text = "conic (sweep)"
    label3.textColor = .white
    label3.translatesAutoresizingMaskIntoConstraints = false
    self.conicView.addSubview(label3)
    NSLayoutConstraint.activate([
      label3.centerYAnchor.constraint(equalTo: self.conicView.centerYAnchor),
      label3.centerXAnchor.constraint(equalTo: self.conicView.centerXAnchor),
    ])
  }
}
