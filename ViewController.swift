//
//  ViewController.swift
//  Novo Novo app
//
//  Created by Rennan Bruno on 04/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    //Variavel de peso
    @IBOutlet weak var tfWeight: UITextField!
    //Variavel de Altura
    @IBOutlet weak var tfHeight: UITextField!
    //Label de resultado = lb
    @IBOutlet weak var lbResult: UILabel!
    //Imagem do corpo a ser mostrada de acordo com o calculo
    @IBOutlet weak var ivResultBody: UIImageView!
    //View label que está com o resultado e imagem
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Botão que calcula os valores dos textFields = TF
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!){
            imc = weight / (height*height)
            showResults()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func showResults(){
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso Ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        lbResult.text = "\(Int(imc)): \(result)"
        ivResultBody.image = UIImage(named: image)
        //Retirando a view escondida
        viResult.isHidden = false
        view.endEditing(true)
    }
        
}

