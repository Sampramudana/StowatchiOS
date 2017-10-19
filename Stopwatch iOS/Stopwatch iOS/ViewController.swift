//
//  ViewController.swift
//  Stopwatch iOS
//
//  Created by Muhammad Hilmy Fauzi on 10/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //deklarasi variable counter
    var counter = 0.0
    //deklarasi timer
    var timer = Timer()
    //deklarasi isPlaying
    var isPlaying = false

    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelStart: UIButton!
    @IBOutlet weak var labelPause: UIButton!
    @IBOutlet weak var labelStop: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //menampilkan teks ke labelTimer
        labelTimer.text = String(counter)
        //agar button pause tidak aktif
        labelPause.isEnabled = false
    }
    @IBAction func btnStart(_ sender: Any) {
        //mengecek apakah sedang playing atau tidak
        if(isPlaying){
            return
        }
        
        //button start tidak aktif
        labelStart.isEnabled = false
        //button pause aktif
        labelPause.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        //mengatur isPlaying nya true
        isPlaying = true
        //mengatur counternya ditambah 0.1
        counter = counter + 0.1
        //menampilkan ke label timer
        //%.1f ini adalah format untuk bilangan berkoma atatu float
        //%.1f ini adalah format untuk bilangan ril atau tidak berkoma
    }

    func UpdateTimer() {
        counter = counter + 0.1
        labelTimer.text = String(format: "%.1f", counter)

    }
    @IBAction func btnStop(_ sender: Any) {
        //agar label start aktif
        labelStart.isEnabled = true
        //agar button pause tidak aktif
        labelPause.isEnabled = false
        
        //menampilkan data yang valid
        timer.invalidate()
        
        //mengatur isPlaying false
        isPlaying = false
        
        //mengatur counter nya menjadi 0 kembali
        counter = 0.0
        //menampilkan timer ke label
        //fungsi dari string(counter) adalah mengubah nilai desimal counter ke dalam bentuk string
        labelTimer.text = String(counter)

    }
    @IBAction func btnPause(_ sender: Any) {
        //agar button start aktif
        labelStart.isEnabled = true
        //agar button pause tidak aktif
        labelPause.isEnabled = false
        
        //menampilkan data yang valid
        timer.invalidate()
        
        //mengatur isPlaying false
        isPlaying = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

