//
//  ViewController.swift
//  swift_tutorial_timer
//
//  Created by 早川マイケル on 2021/01/25.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    var count = Int()
    var imageArray = [UIImage]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // カウントを初期化
        count = 0

        // stopボタンを押せなくする
        stopButton.isEnabled = false
        
        // 画像読み込み
        for i in 0..<5{
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
    }
    
    func startTimer(){
        // タイマーを回す
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    // 0.2秒ごとに呼ばれる
    @objc func timerUpdate(){
        count = count + 1
        
        if count > 4
        {
            count = 0
        }
        imageView.image = imageArray[count]
    }

    
    
    @IBAction func start(_ sender: Any) {
        // startボタンを押せるようにする
        startButton.isEnabled = false
        
        // stopボタンを押せるようにする
        stopButton.isEnabled = true

        // 画像を反映
        startTimer()
    }
    
    
    
    @IBAction func stop(_ sender: Any) {
        // startボタンを押せるようにする
        startButton.isEnabled = true

        // stopボタンを押せないようにする
        stopButton.isEnabled = false

        // 画像を止める
        timer.invalidate()
        
        
    }


}

