//
//  ViewController.swift
//  firstAppViewCode2
//
//  Created by user212294 on 2/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1 / 255, green: 180 / 255, blue: 195 / 255, alpha: 1)
        
        return view
    }()
    
    private let labelTitleView: UILabel = {
        let label = UILabel()
        label.text = "Calculo de IMC"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 36)
        return label
    }()
    
    private let labelUnderTitle: UILabel = {
        let label = UILabel()
        label.text = "Descubra o seu indice de massa corporal"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
        
    }()
    
    private let labelWeight: UILabel = {
        let label = UILabel()
        label.text = "Peso (kg)"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    private let labelHeight: UILabel = {
        let label = UILabel()
        label.text = "Altura (m)"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
        
    }()
    
    private let tfWeight: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Ex: 75"
        
        return tf
    }()
    
    private let tfHeight: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Ex: 1.75"
        
        return tf
    }()
    
    private let btCalculate: UIButton = {
        let button = UIButton()
        button.setTitle("CALCULAR", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor( .black, for: .normal)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
            
        return button
    }()
    
    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private let lbSeuIndice: UILabel = {
        let label = UILabel()
        label.text = "Seu indice de massa corporal é"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    private let lbIndiceValue: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 36)
        
        return label
    }()
    
    private let ivResult: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    

    override func loadView() {
        super.loadView()
        self.view.addSubview(mainView)
        secondView.isHidden = true
        
        let screens = [labelTitleView, labelUnderTitle, labelWeight, labelHeight, tfWeight, tfHeight, btCalculate, secondView]
        for screen in screens {
            mainView.addSubview(screen)
            screen.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let itensSecondView = [lbSeuIndice, lbIndiceValue, ivResult]
        for iten in itensSecondView {
            secondView.addSubview(iten)
            iten.translatesAutoresizingMaskIntoConstraints = false
        }
        
        constraints()
        
        
        self.view = mainView
       
    }

    func constraints() {
        
        //Constraints title
        labelTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mainView.centerXAnchor.constraint(equalTo: labelTitleView.centerXAnchor).isActive = true
        labelTitleView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 50).isActive = true
        
        //Constraints underTitle
        labelUnderTitle.heightAnchor.constraint(equalToConstant: 21).isActive = true
        mainView.centerXAnchor.constraint(equalTo: labelUnderTitle.centerXAnchor).isActive = true
        labelUnderTitle.topAnchor.constraint(equalTo: labelTitleView.bottomAnchor, constant: 20).isActive = true
        
        //Weight label
        labelWeight.heightAnchor.constraint(equalToConstant: 21).isActive = true
        mainView.centerXAnchor.constraint(equalTo: labelWeight.centerXAnchor, constant: 80).isActive = true
        labelWeight.topAnchor.constraint(equalTo: labelUnderTitle.bottomAnchor, constant: 50).isActive = true
        
        //Height label
        labelHeight.heightAnchor.constraint(equalToConstant: 21).isActive = true
        mainView.centerXAnchor.constraint(equalTo: labelHeight.centerXAnchor, constant: -80).isActive = true
        labelHeight.topAnchor.constraint(equalTo: labelUnderTitle.bottomAnchor, constant: 50).isActive = true
        
        //Weight tf
        tfWeight.heightAnchor.constraint(equalToConstant: 34).isActive = true
        tfWeight.widthAnchor.constraint(equalToConstant: 110).isActive = true
        labelWeight.centerXAnchor.constraint(equalTo: tfWeight.centerXAnchor).isActive = true
        tfWeight.topAnchor.constraint(equalTo: labelHeight.bottomAnchor, constant: 20).isActive = true
        
        //Height tf
        tfHeight.heightAnchor.constraint(equalToConstant: 34).isActive = true
        tfHeight.widthAnchor.constraint(equalToConstant: 110).isActive = true
        labelHeight.centerXAnchor.constraint(equalTo: tfHeight.centerXAnchor).isActive = true
        tfHeight.centerYAnchor.constraint(equalTo: tfWeight.centerYAnchor).isActive = true
        
        //botao calculate
        btCalculate.heightAnchor.constraint(equalToConstant: 44).isActive = true
        mainView.centerXAnchor.constraint(equalTo: btCalculate.centerXAnchor).isActive = true
        btCalculate.topAnchor.constraint(equalTo: tfWeight.bottomAnchor, constant: 40).isActive = true
        btCalculate.leadingAnchor.constraint(equalTo: tfWeight.leadingAnchor).isActive = true
        btCalculate.trailingAnchor.constraint(equalTo: tfHeight.trailingAnchor).isActive = true
        
        //second view
        secondView.topAnchor.constraint(equalTo: btCalculate.bottomAnchor, constant: 20).isActive = true
        mainView.centerXAnchor.constraint(equalTo: secondView.centerXAnchor).isActive = true
        secondView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0).isActive = true
        secondView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0).isActive = true
        secondView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
        //lbSeuindice
        lbSeuIndice.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 16).isActive = true
        secondView.centerXAnchor.constraint(equalTo: lbSeuIndice.centerXAnchor).isActive = true
        
        //lbIndiceValue
        lbIndiceValue.topAnchor.constraint(equalTo: lbSeuIndice.bottomAnchor, constant: 16).isActive = true
        secondView.centerXAnchor.constraint(equalTo: lbIndiceValue.centerXAnchor).isActive = true
        
        //image
        ivResult.topAnchor.constraint(equalTo: lbIndiceValue.bottomAnchor, constant: 16).isActive = true
        ivResult.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 16).isActive = true
        ivResult.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: 16).isActive = true
        mainView.centerXAnchor.constraint(equalTo: ivResult.centerXAnchor).isActive = true
        ivResult.bottomAnchor.constraint(equalTo: secondView.bottomAnchor, constant: -16).isActive = true
        
                                              
        
    }
    
    var imc: Double = 0
    
    @objc func tapButton() {
        print("Esta funcionando")
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
            imc = weight / (height * height)
            showResult()
        }
    }
    
    func showResult() {
        var result: String = ""
        var image: String = ""
        switch imc {
            case 0 ..< 16:
                result = "Magreza"
                image = "abaixo"
            case 16 ..< 18.5:
                result = "Abaixo do peso"
                image =  "abaixo"
            case 18.5 ..< 25:
                result = "Peso ideal"
                image = "ideal"
            case 25 ..< 30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        lbIndiceValue.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        secondView.isHidden = false
    }
    

}


