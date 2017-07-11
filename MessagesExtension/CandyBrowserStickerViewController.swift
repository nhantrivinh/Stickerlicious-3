//
//  CandyBrowserStickerViewController.swift
//  Stickerlicious
//
//  Created by Jayven Nhan on 7/9/17.
//  Copyright © 2017 Jayven Nhan. All rights reserved.
//

import UIKit
import Messages

//let stickersName = ["CandyCane", "Caramel", "ChocolateBar", "ChocolateChip", "DarkChocolate", "GummiBear", "JawBreaker", "Lollipop", "SourCandy"]
class CandyBrowserViewController: MSStickerBrowserViewController {
    
    let freeStickersName: [String] = {
        var stickers = [String]()
        for i in 41...65 {
            let name = "\(i)"
            stickers.append(name)
        }
        return stickers
    }()
    
    
    let purchase1StickersName: [String] = {
        var stickers = [String]()
        for i in 1...20 {
            let name = "\(i)"
            stickers.append(name)
        }
        return stickers
    }()
    
    let purchase2StickersName: [String] = {
        var stickers = [String]()
        for i in 21...40 {
            let name = "\(i)"
            stickers.append(name)
        }
        return stickers
    }()
    
    let purchase3StickersName: [String] = {
        var stickers = [String]()
        for i in 66...80 {
            let name = "\(i)"
            stickers.append(name)
        }
        return stickers
    }()

    
    var stickers = [MSSticker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStickers()        
    }
    
    func loadStickers(chocoholic: Bool = false) {
        
        var imageNames = freeStickersName
        imageNames += purchase1StickersName
        imageNames += purchase2StickersName
        imageNames += purchase3StickersName
        
        if chocoholic {
            imageNames = imageNames.filter({ name in
                return name.contains("Chocolate")
            })
            print("Image Names:")
            print(imageNames)
        }
        
        print(stickers.count)
        stickers = imageNames.map({ name in
            let url = Bundle.main.url(forResource: name, withExtension: "png")!
            return try! MSSticker(contentsOfFileURL: url, localizedDescription: name)
        })
        
        print("Updated Stickers:")
        print(stickers.count)
    }
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}

protocol Chocoholicable {
    func setChocoholic(_ chocoholic: Bool)
}

extension CandyBrowserViewController: Chocoholicable {
    
    func setChocoholic(_ chocoholic: Bool) {
        loadStickers(chocoholic: chocoholic)
        stickerBrowserView.reloadData()
    }
    
}
