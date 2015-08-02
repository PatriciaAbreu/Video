//
//  ViewController.swift
//  testeVideo
//
//  Created by Patricia de Abreu on 02/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//


// adicionar o video no Project Navigator -> Build Phases -> Copy Bundle Resourses

import UIKit

// adicionar MediaPlayer
import MediaPlayer

class ViewController: UIViewController {

    var movie: MPMoviePlayerController?
    
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var btnPlayEPause: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playMovie(){
        
        if let path = NSBundle.mainBundle().pathForResource("teste", ofType: "mov"), let url = NSURL.fileURLWithPath(path), movie = MPMoviePlayerController(contentURL: url) {
            
            self.movie = movie
            movie.view.frame = videoView.bounds
            movie.view.layer.position.x = 380
            movie.view.layer.position.y = 250
//            movie.prepareToPlay()
            movie.scalingMode = .AspectFill
            self.view.addSubview(movie.view)
            
        }else {
            debugPrintln("Video não encontrado")
        }
    }
    @IBAction func btnPlay(sender: AnyObject) {
        if btnPlayEPause.titleLabel?.text == "VIDEO" {
            playMovie()
            movie?.play()
            btnPlayEPause.hidden = true
//            btnPlayEPause.setTitle("PAUSE", forState: UIControlState())
        }else {
            movie?.pause()
//            btnPlayEPause.setTitle("PLAY", forState: UIControlState())
        }
        
    }
    
}

