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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playMovie()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playMovie(){
        
        if let path = NSBundle.mainBundle().pathForResource("teste", ofType: "mov"), let url = NSURL.fileURLWithPath(path), movie = MPMoviePlayerController(contentURL: url) {
            self.movie = movie
            movie.view.frame = self.view.bounds
            movie.prepareToPlay()
            movie.scalingMode = .AspectFill
            self.view.addSubview(movie.view)
        }else {
            debugPrintln("Video não encontrado")
        }
    }
}

