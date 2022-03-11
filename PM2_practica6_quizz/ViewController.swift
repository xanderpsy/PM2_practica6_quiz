//
//  ViewController.swift
//  PM2_practica6_quizz
//
//  Created by Xanderpsy on 05/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var preguntaLabel: UILabel!
    @IBOutlet weak var verdadero: UIButton!
    @IBOutlet weak var falsoBtn: UIButton!
    @IBOutlet weak var barraProgressPV: UIProgressView!
    @IBOutlet weak var puntosUILabel: UILabel!
    @IBOutlet weak var mensajeUILabel: UILabel!
    var numPregunta = 0
    var puntuaje = 0
    
  //  let preguntas = ["pregunta1","pregunta2","pregunta3"]
    let preguntas = [Pregunta(texto: "¿Estamos vivos?", respuesta: "Verdadero"),
                     Pregunta(texto: "¿Tenemos 4 pies ?", respuesta: "Falso"),
                     Pregunta(texto: "¿Tenemos 2 pulmones?", respuesta: "Verdadero"),
                     Pregunta(texto: "¿Tenemos tentaculos?", respuesta: "Falso"),
                     Pregunta(texto: "¿Eres humano?", respuesta: "Verdadero"),
                     Pregunta(texto: "¿Volamos por los aires?", respuesta: "Falso"),
                     Pregunta(texto: "¿Somos dioses?", respuesta: "Falso"),
                     Pregunta(texto: "¿Tenemos mas de dos ojos??", respuesta: "Falso"),
                     Pregunta(texto: "¿Tenemos un corazon?", respuesta: "Verdadero"),
                     Pregunta(texto: "¿Estamos en una simulacion?", respuesta: "Falso")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cambiarPregunta()
    }

    @IBAction func respuestaBtn(_ sender: UIButton) {
        print("Boton presionado: \(sender.currentTitle)")
        
        //cambiar a otra pregunta
        //preguntaLabel.text = preguntas[0]
        let respuestaUsuario = sender.currentTitle
        let respuestaCorrecta = preguntas[numPregunta].respuesta
        
        if respuestaUsuario == respuestaCorrecta{
            mensajeUILabel.text = "respuesta correcta"
            sender.backgroundColor = UIColor.green
            puntuaje += 1
            puntosUILabel.text = "Puntos:\(puntuaje * 10)"
        }else{
            mensajeUILabel.text = "respuesta incorrecta"
            sender.backgroundColor = UIColor.red
        }
        if numPregunta + 1 < preguntas.count{
            numPregunta += 1
        }else {
            let alerta = UIAlertController(title: "Felicidades", message: "Obtuviste \(puntuaje * 10) Puntos", preferredStyle: .alert)
                        
                        let accionsalir = UIAlertAction(title: "salir", style: .cancel){ _ in exit(0)}
            let accionJugarNuevo = UIAlertAction(title:"jugar de nuevo", style: .default){_ in self.reset()}
                        alerta.addAction(accionJugarNuevo)
                        alerta.addAction(accionsalir)
                        present(alerta, animated: true, completion: nil)

        }
        
        Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(cambiarPregunta), userInfo: nil, repeats: false)
        
        
    }
    @objc func cambiarPregunta(){
        preguntaLabel.text = preguntas[numPregunta].texto
        verdadero.backgroundColor = UIColor.white
        falsoBtn.backgroundColor = UIColor.white
        barraProgressPV.progress = Float(numPregunta + 1)/Float(preguntas.count)
        mensajeUILabel.text = "  "
        
      
    }
    func reset(){
        
        numPregunta = 0
        puntuaje = 0
        preguntaLabel.text = preguntas[numPregunta].texto
        puntosUILabel.text = "Puntos:\(puntuaje * 10)"
    }
}

