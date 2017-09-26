//
//  ViewController.swift
//  ZHIBO
//
//  Created by Shelton Lee on 2017/8/9.
//  Copyright © 2017年 Shelton Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var live: YKCell!
    var playerView: UIView!
    var ijkPlayer: IJKMediaPlayback!

    @IBOutlet weak var imgBack: UIImageView!
    @IBOutlet weak var btLove: UIButton!
    @IBOutlet weak var btGift: UIButton!
    
    
    @IBOutlet weak var btBack: UIButton!
//    @IBAction func tapBack(_ sender: Any) {
////        navigationController?.popViewController(animated: true)
////        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
    
    @IBAction func tapGift(_ sender: UIButton) {
        let duration = 3.0
        let car = UIImageView(image: #imageLiteral(resourceName: "porsche"))
        car.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(car)
        
        let heightCar: CGFloat = 125
        let widthCar: CGFloat = 250
        UIView.animate(withDuration: duration) { 
            car.frame = CGRect(x: self.view.center.x - widthCar/2, y: self.view.center.y - heightCar/2, width: widthCar, height: heightCar)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) { 
            UIView.animate(withDuration: duration, animations: { 
                car.alpha = 0
            }, completion: { (completed) in
                car.removeFromSuperview()
            })
        }
        
        let layerFW = CAEmitterLayer()
        view.layer.addSublayer(layerFW)
        emmitParticles(from: sender.center, emitter: layerFW, in: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration*2) { 
            layerFW.removeFromSuperlayer()
        }
        
        
    }
    
    @IBAction func tapLove(_ sender: UIButton) {
        let heart = DMHeartFlyView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        heart.center = CGPoint(x: btLove.frame.origin.x, y: btLove.frame.origin.y)
        
        view.addSubview(heart)
        heart.animate(in: view)
        
        //爱心按钮 大小的关键帧动画
        let btnAnime = CAKeyframeAnimation(keyPath: "transform.scale")
        btnAnime.values = [1.0,0.7,0.5,0.3,0.5,0.7,1.0,1.2,1.4,1.2,1.0]
        btnAnime.keyTimes = [0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
        btnAnime.duration = 0.2
        sender.layer.add(btnAnime, forKey: "SHOW")

    }
    
    func setbg() {
        let url = URL(string: live.portrait)
        imgBack.kf.setImage(with: url)
        
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        
        effectView.frame = imgBack.bounds
        imgBack.addSubview(effectView)
        
    }
    func setPlayerView() {
        self.playerView = UIView(frame: view.bounds)
        view.addSubview(self.playerView)
        
        ijkPlayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        
        let pv = ijkPlayer.view!
        pv.frame = playerView.bounds
        pv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        playerView.insertSubview(pv, at: 1)
        ijkPlayer.scalingMode = .aspectFill
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !self.ijkPlayer.isPlaying() {
            ijkPlayer.prepareToPlay()
        }
    }
    
    func setToFont()  {
        view.bringSubview(toFront: btGift)
        view.bringSubview(toFront: btLove)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setbg()
        setPlayerView()
        setToFont()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ijkPlayer.shutdown()
    }
//    override func willMove(toParentViewController parent: UIViewController?) {
//        super.willMove(toParentViewController: parent)
//        ijkPlayer.shutdown()
//    }


}

