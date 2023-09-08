//
//  ViewController.swift
//  sayi tahmini oyunu
//
//  Created by Melisa Erdem on 7.09.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtTahminEdilecekSayi: UITextField!
    @IBOutlet weak var imgKaydet: UIImageView!
    @IBOutlet weak var buttonKaydet: UIButton!
    @IBOutlet weak var txtTahminSayisi: UITextField!
    @IBOutlet weak var imgTahminDurum: UIImageView!
    @IBOutlet weak var buttonDene: UIButton!
    @IBOutlet weak var lblSonuc: UILabel!
    @IBOutlet weak var imgYildiz1: UIImageView!
    @IBOutlet weak var imgYildiz2: UIImageView!
    @IBOutlet weak var imgYildiz5: UIImageView!
    @IBOutlet weak var imgYildiz4: UIImageView!
    @IBOutlet weak var imgYildiz3: UIImageView!
    var yildizlar : [UIImageView] = [UIImageView]()
    let maxDenemeSayisi : Int = 5
    var denemeSayisi : Int = 0
    var hedefSayi : Int = -1
    var oyunBasarili : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        yildizlar = [imgYildiz1,imgYildiz2,imgYildiz3,imgYildiz4,imgYildiz5]
        buttonDene.isEnabled = false
     
    }

    @IBAction func btnKaydetClicked(_ sender: UIButton) {
        imgKaydet.isHidden = false
        if let t=Int(txtTahminEdilecekSayi.text!){
            hedefSayi = t
            buttonDene.isEnabled = true
            buttonKaydet.isEnabled = false
            imgKaydet.image = UIImage(named: "onay")
        }else{
            imgKaydet.image = UIImage(named: "hata")
        }
    }
    @IBAction func btnDeneClicked(_ sender: UIButton) {
        if oyunBasarili == true || denemeSayisi > maxDenemeSayisi {
            return
        }
        if let girilenSayi = Int(txtTahminSayisi.text!) {
            denemeSayisi += 1
            yildizlar[denemeSayisi-1].image = UIImage(named: "beyazYildiz")
            imgTahminDurum.isHidden = false
            if girilenSayi > hedefSayi{
                imgTahminDurum.image = UIImage(named: "asagi")
                txtTahminSayisi.backgroundColor = UIColor.red
            }else if girilenSayi<hedefSayi{
                imgTahminDurum.image = UIImage(named: "yukari")
                txtTahminSayisi.backgroundColor = UIColor.red

            }else{
                imgTahminDurum.image = UIImage(named: "el")
                buttonKaydet.isEnabled = true
                lblSonuc.text = "DOĞRU TAHMİN"
                txtTahminSayisi.backgroundColor = UIColor.green
                txtTahminEdilecekSayi.isSecureTextEntry = false
                let alertController = UIAlertController(title: "BAŞARILI", message: "Sayıyı doğru tahmin ettin.Tebrikler", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
                alertController.addAction(okAction)
                present(alertController, animated: true)
                return
            }
            
            if denemeSayisi == maxDenemeSayisi{
                buttonDene.isEnabled = false
                imgTahminDurum.image = UIImage(named: "hata")
                lblSonuc.text = "Oyun Başarısız Arkadaşın \(hedefSayi) Sayısını Girmişti."
                let alertController = UIAlertController(title: "UYARI", message: "Deneme hakkınızı doldurdunuz!", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
                alertController.addAction(okAction)
                present(alertController, animated: true)
                let playAgain = UIAlertAction(title: "YENİDEN OYNA", style: UIAlertAction.Style.default)
                alertController.addAction(playAgain)
                return
            }
        }
        
        
        
    }
    
}

