# SAILoadingView

[![CI Status](http://img.shields.io/travis/Septiyan Andika/SAILoadingView.svg?style=flat)](https://travis-ci.org/Septiyan Andika/SAILoadingView)
[![Version](https://img.shields.io/cocoapods/v/SAILoadingView.svg?style=flat)](http://cocoapods.org/pods/SAILoadingView)
[![License](https://img.shields.io/cocoapods/l/SAILoadingView.svg?style=flat)](http://cocoapods.org/pods/SAILoadingView)
[![Platform](https://img.shields.io/cocoapods/p/SAILoadingView.svg?style=flat)](http://cocoapods.org/pods/SAILoadingView)

## Preview

![Loading View Preview](https://raw.githubusercontent.com/SeptiyanAndika/SAILoadingView/master/Preview/loadingView.gif)
![Loading View](https://raw.githubusercontent.com/SeptiyanAndika/SAILoadingView/master/Preview/loading.png)
![Error message](https://raw.githubusercontent.com/SeptiyanAndika/SAILoadingView/master/Preview/error.pnd)
![Error message With Retry Button](https://raw.githubusercontent.com/SeptiyanAndika/SAILoadingView/master/Preview/retry.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation
1. Just add SAILoadingView.swift and  SAILoadingView.xib file to your project,  file are present inside SAILoadingView/Classes directory.

2. SAILoadingView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SAILoadingView"
```

## Function

	 func showLoading(text:String)

Function to show loading view and text progress

	 func dismissLoading()

Function to dismiss loading view 


	 func showError(text:String)

Function to show error message, if Properties onClickRetry not nil or declarede will show button retry, if onClickRetry not declared or nil button retry will be hidden

## Properties
```swift
public final var onClickRetry: (Void -> Void)?

example :
var loadingView = SAILoadingView(parent: self.view)


loadingView?.onClickRetry = {
            
            self.loadData()
        }
```
* show retry button, and handle action when retry button clicked

## Author

Septiyan Andika, septiyan.andika@gmail.com

## License

SAILoadingView is available under the MIT license. See the LICENSE file for more info.
