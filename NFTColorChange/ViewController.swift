//
//  ViewController.swift
//  NFTColorChange
//
//  Created by Ashin Wang on 2022/1/3.
//

import UIKit

class ViewController: UIViewController {
    //pic
    @IBOutlet weak var punkImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var faceView: UIView!
    
    //RGBslider text
    @IBOutlet weak var redText: UILabel!
    @IBOutlet weak var greenText: UILabel!
    @IBOutlet weak var blueText: UILabel!
    
    
    //RGBslider
    @IBOutlet weak var redSlider: designableSlider!
    @IBOutlet weak var greenSlider: designableSlider!
    @IBOutlet weak var blueSlider: designableSlider!
    //alpha & text
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var alphaText: UILabel!
    //gradient
    @IBOutlet weak var gradientText: UILabel!
    @IBOutlet weak var gradient: UISlider!
    
    //radious
    @IBOutlet weak var radious: UISlider!
    @IBOutlet weak var radiousText: UILabel!
    //shadow
    @IBOutlet weak var shadow: UISlider!
    @IBOutlet weak var shadowText: UILabel!
    //face
    @IBOutlet weak var faceColor: UISlider!
    @IBOutlet weak var faceColorText: UILabel!
    //bg
    @IBOutlet weak var bgColor: UISlider!
    @IBOutlet weak var bgColorText: UILabel!
    
    
    //switch
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var gradientSwitch: UISwitch!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //RGB換色
    @IBAction func sliderControl(_ sender: designableSlider) {
        punkImage.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        redText.text = String(format: "%.2f", redSlider.value)
        greenText.text = String(format: "%.2f", greenSlider.value)
        blueText.text = String(format: "%.2f", blueSlider.value)
        
    }
    //透明度
    @IBAction func alphaSlider(_ sender: UISlider) {
        punkImage.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        alphaText.text = String(format: "%.2f", alphaSlider.value)
    }
    
    
    //臉部換色
    
    @IBAction func faceColorSlider(_ sender: UISlider) {
        let faceGradientLayer = CAGradientLayer()
        let faceLocation = round(15*faceColor.value)/15
        faceGradientLayer.colors = [UIColor.yellow.cgColor,UIColor.green.cgColor]
        faceGradientLayer.frame = faceView.bounds
        faceGradientLayer.locations = [0.0,NSNumber(value: faceLocation)]
        
        faceView.layer.addSublayer(faceGradientLayer)
        faceColorText.text = String(format: "%.2f", faceColor.value)
    }
    
    
    //背景換色
    @IBAction func bgColorSlider(_ sender: UISlider) {
        let bgGradientLayer = CAGradientLayer()
        let bgLocation = round(15*bgColor.value)/15
        bgGradientLayer.colors = [UIColor.red.cgColor,UIColor.yellow.cgColor]
        bgGradientLayer.frame = bgView.bounds
        bgGradientLayer.locations = [0.0,NSNumber(value: bgLocation)]
        bgView.layer.addSublayer(bgGradientLayer)
        
        bgColorText.text = String(format: "%.2f", bgColor.value)
    }
    
    
    //圓角CornerRadious
    
    @IBAction func radiousSlider(_ sender: UISlider) {
        bgView.clipsToBounds = true
        punkImage.layer.cornerRadius = CGFloat(radious.value)
        bgView.layer.cornerRadius = CGFloat(radious.value)
        shadowView.layer.cornerRadius = CGFloat(radious.value)
//        faceView.layer.cornerRadius = CGFloat(radious.value)
        //陰影面的圓角設定
        shadow.layer.cornerRadius = CGFloat(radious.value)
        
        radiousText.text = String(format: "%.2f", radious.value)
    }
    
    //陰影shadowView
    @IBAction func shadowSlider(_ sender: UISlider) {
        shadowView.layer.masksToBounds = false //超過邊框的陰影不做裁切
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 7, height: 7)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowRadius = CGFloat(shadow.value)
        
        shadowText.text = String(format: "%.2f", shadow.value)
    
    }
    
    
    
    //漸層gradient
    @IBAction func changeGradientSlider(_ sender: UISlider) {
        let gradientLayer = CAGradientLayer()
        let gradientEffect = round(15*gradient.value)/15
        //設定漸層顏色
        gradientLayer.colors = [UIColor.orange.cgColor,UIColor.blue.cgColor]
        //Layer大小和位置
        gradientLayer.frame = bgView.bounds
        
        //漸層變化的方向
        gradientLayer.locations = [0.0,NSNumber(value: gradientEffect) ]
        bgView.layer.addSublayer(gradientLayer)
        
        gradientText.text = String(format: "%.2f", gradient.value)
    }
    
    
    //隨機配色按鈕
    @IBAction func randomBtn(_ sender: UIButton) {
//        let red = Float.random(in: 0...1)
//        let green = Float.random(in: 0...1)
//        let blue = Float.random(in: 0...1)
//        let alpha = Double.random(in: 0...1)
        
        
        
        
        redSlider.setValue(Float.random(in: 0...1), animated: true)
        greenSlider.setValue(Float.random(in: 0...1), animated: true)
        blueSlider.setValue(Float.random(in: 0...1), animated: true)
        alphaSlider.setValue(Float.random(in: 0...1), animated: true)
        
        
        //將隨機放入顯色位置
        punkImage.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        
        //讓label跟著顯示
        redText.text = String(format: "%.2f", redSlider.value)
        greenText.text = String(format: "%.2f", greenSlider.value)
        blueText.text = String(format: "%.2f", blueSlider.value)
        alphaText.text = String(format: "%.2f", alphaSlider.value)
        
        redSlider.value = Float(redSlider.value)
        greenSlider.value = Float(greenSlider.value)
        blueSlider.value = Float(blueSlider.value)
        alphaSlider.value = Float(alphaSlider.value)
        
      
        
    }
    //switch開關控制
    
    @IBAction func rgbSwitch(_ sender: UISwitch) {
        if redSwitch.isOn{
            redSlider.isEnabled = true
        }else{
            redSlider.isEnabled = false
        }
        if greenSwitch.isOn{
            greenSlider.isEnabled = true
        }else{
            greenSlider.isEnabled = false
        }
        if blueSwitch.isOn{
            blueSlider.isEnabled = true
        }else{
            blueSlider.isEnabled = false
            
        }
    }
    
    
    @IBAction func switchBtn(_ sender: UISwitch) {
       
        //RGB三個開關都開啟時，隨機才會啟動
        if gradientSwitch.isOn{
            redSwitch.isEnabled = false
            redSlider.isEnabled = false
            greenSwitch.isEnabled = false
            greenSlider.isEnabled = false
            blueSwitch.isEnabled = false
            blueSlider.isEnabled = false
        }else{
            redSlider.isEnabled = true
            redSwitch.isEnabled = true
            greenSwitch.isEnabled = true
            greenSlider.isEnabled = true
            blueSlider.isEnabled = true
            blueSwitch.isEnabled = true
            alphaSlider.value = 1
        }
            //圖片背景設定
            punkImage.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            redSlider.value = 1
            greenSlider.value = 1
            blueSlider.value = 1
            alphaSlider.value = 0
            
            redText.text = String(format: "%.2f", redSlider.value)
            greenText.text = String(format: "%.2f", greenSlider.value)
            blueText.text = String(format: "%.2f", blueSlider.value)
            alphaText.text = String(format: "%.2f", alphaSlider.value)
        }

    
}

