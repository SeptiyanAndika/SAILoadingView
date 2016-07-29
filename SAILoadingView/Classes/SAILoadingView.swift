//
//  LoadingView.swift
//  Andika.me
//
//  Created by Septiyan Andika on 7/14/16.
//

import UIKit

public class SAILoadingView: UIView {
    
    @IBOutlet var loadingContainer: UIView!
    @IBOutlet var retryContainer: UIView!
    @IBOutlet var lblLoading: UILabel!
    @IBOutlet var lblError: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
  
    @IBOutlet var butRetry: UIButton!
    
    private let centerView: UIView = UIView()
    private var parent: UIView?
    private let label = UILabel()
    
    public final var onClickRetry: (Void -> Void)?
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
         xibSetup ()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
   public convenience init(parent:UIView){
        self.init(frame: parent.frame)
        xibSetup ()
        label.font = UIFont.systemFontOfSize(28)
        self.parent = parent
        xibSetup ()
    }
    
   public convenience init(parent:UIView,frame:CGRect){
        self.init(frame: frame)
        xibSetup ()
        label.font = UIFont.systemFontOfSize(28)
        self.parent = parent
        
    }
    
    
   public convenience init(parent:UIView, fontName:String){
        self.init(frame: parent.frame)
        xibSetup ()
        label.font = UIFont(name: fontName, size: 14)
      
    }

    private func setupView(){
         if !self.isDescendantOfView(self.parent!) {
          self.parent!.addSubview(self)
            if onClickRetry  == nil{
              butRetry.hidden =  true
            }
        }
    }
    
   public func showLoading(text:String){
        setupView()
        retryContainer.hidden = true;
        loadingContainer.hidden = false;
        lblLoading.text = text
      
    }
    
  public  func dismissLoading(){
        self.removeFromSuperview()
    }
    
  public  func showError(text:String){
          setupView()
        retryContainer.hidden = false;
        loadingContainer.hidden = true;
        lblError.text = text
    }
    
    

    
    @IBAction func actionRetry(sender: AnyObject) {
        if onClickRetry?() != nil{
            retryContainer.hidden = true;
            loadingContainer.hidden = false;
        }
    }

    var view: UIView!
    
    func xibSetup() {
        view = loadViewFromNib()
        
        view.frame = bounds
        
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "SAILoadingView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    

}
