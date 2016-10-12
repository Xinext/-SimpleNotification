//
//  AdModMgr.swift
//

import UIKit
import GoogleMobileAds

/**
 - [ENG]The UIViewController for AdMod.
 - [JPN]AdMod管理用 UIViewController
 - Author: Hiroaki Fujisawa
 - Copyright: xinext
 - Date: 2016/10/07
 - Version: 1.0.0
 */
class AdModMgr: UIViewController, GADBannerViewDelegate {

    let adBannerView = GADBannerView(adSize:kGADAdSizeSmartBannerPortrait)
    var _contentsView: UIView? = nil
    
    enum DISP_POSITION: Int {
        case TOP = 0
        case BOTTOM
    }
    
    /**
     Initialization of processing
     - parameter pvc: ViewController Parent ViewController.
     - parameter cv: UIView The view of contents related to AD.
     - returns: nothing
     */
    func initManager(pvc: ViewController, cv: UIView) {
        
        pvc.addChildViewController(self)
        
        _contentsView = cv
        
        adBannerView.isHidden = true
        adBannerView.adUnitID = ADMOD_UNITID
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        
        let gadRequest:GADRequest = GADRequest()
        adBannerView.load(gadRequest)
        
        self.parent?.view.addSubview(adBannerView)
    }

    /**
     Display AdView.
     - parameter pos: DISP_POSITION
     - returns: nothing
     */
    func dispAdView(pos: DISP_POSITION) {
        
        _contentsView?.frame.size.height -= adBannerView.frame.size.height
        
        var rectBanner:CGRect
        
        switch pos {
        case DISP_POSITION.TOP:
            let banner_x: CGFloat = 0.0
            let banner_y: CGFloat = _contentsView!.frame.origin.y
            let banner_width: CGFloat = adBannerView.frame.size.width
            let banner_height: CGFloat = adBannerView.frame.size.height
            rectBanner = CGRect(x: banner_x, y: banner_y, width: banner_width, height: banner_height)
            
            _contentsView?.frame.origin.y += adBannerView.frame.size.height
        
        default:    // bottom
            let banner_x: CGFloat = 0.0
            let banner_y: CGFloat = self.view.frame.size.height - adBannerView.frame.size.height
            let banner_width: CGFloat = adBannerView.frame.size.width
            let banner_height: CGFloat = adBannerView.frame.size.height
            rectBanner = CGRect(x: banner_x, y: banner_y, width: banner_width, height: banner_height)
            
            _contentsView?.bounds.origin.y = 0
        }

        adBannerView.frame = rectBanner
        
        adBannerView.isHidden = false
    }

    /**
     Hide AdView.
     - parameter pos: DISP_POSITION
     - returns: nothing
     */
    func hideAdView() {
        _contentsView?.frame.size.height += adBannerView.frame.size.height
        adBannerView.isHidden = true
    }
}
