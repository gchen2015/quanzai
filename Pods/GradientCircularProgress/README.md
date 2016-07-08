# Gradient Circular Progress

Customizable progress indicator library in Swift

## Requirements
- Swift 2.2
- iOS 8.0 or later

## Screen Shots

- Preset style: [BlueDarkStyle.swift](https://github.com/keygx/GradientCircularProgress/blob/master/Source/BlueDarkStyle.swift)

![](images/scr_BlueDarkStyle_01.png)  ![](images/scr_BlueDarkStyle_02.png)

- All preset styles

![](images/styles_01.png) 
![](images/styles_02.png) 

- Example Use AddSubView

![](images/scr_AddSubViewEx_01.png)  ![](images/scr_AddSubViewEx_02.png)

## Installation

###CocoaPods

* PodFile [Sample/PodFile]

```PodFile
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'GradientCircularProgress', :git => 'https://github.com/keygx/GradientCircularProgress'
```
* install

```
$ pod install
```

###Carthage

* Cartfile

```Cartfile
github "keygx/GradientCircularProgress"
```

```
$ carthage update
```
* install

To integrate "GradientCircularProgress.framework" into your Xcode project


## Style Settings

Please make your original styles

![](images/properties.png)

- Define custom style structs that implements the StyleProperty Protocol

[MyStyle.swift](https://github.com/keygx/GradientCircularProgress/blob/master/Sample/MyStyle.swift)

```swift
import GradientCircularProgress

public struct MyStyle : StyleProperty {
    /*** style properties **********************************************************************************/
    
    // Progress Size
    public var progressSize: CGFloat = 200
    
    // Gradient Circular
    public var arcLineWidth: CGFloat = 18.0
    public var startArcColor: UIColor = UIColor.clearColor()
    public var endArcColor: UIColor = UIColor.orangeColor()
    
    // Base Circular
    public var baseLineWidth: CGFloat? = 19.0
    public var baseArcColor: UIColor? = UIColor.darkGrayColor()
    
    // Ratio
    public var ratioLabelFont: UIFont? = UIFont(name: "Verdana-Bold", size: 16.0)
    public var ratioLabelFontColor: UIColor? = UIColor.whiteColor()
    
    // Message
    public var messageLabelFont: UIFont? = UIFont.systemFontOfSize(16.0)
    public var messageLabelFontColor: UIColor? = UIColor.whiteColor()
    
    // Background
    public var backgroundStyle: BackgroundStyles = .Dark
    
    /*** style properties **********************************************************************************/
    
    public init() {}
}

```

![](images/scr_MyStyle.png)

## Usage
```swift
import GradientCircularProgress
```
### Basic
#### UIWindow
```swift
let progress = GradientCircularProgress()

progress.show(message: "Loading...", MyStyle())

progress.dismiss()
```
#### addSubView
```swift
let progress = GradientCircularProgress()

let progressView = progress.show(frame: rect, message: "Loading...", style: MyStyle())
view.addSubview(progressView!)

progress.dismiss(progress: progressView!)
```

### at Rtio
#### UIWindow
```swift
let progress = GradientCircularProgress()

let ratio: CGFloat = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)        
progress.showAtRatio(style: MyStyle())

progress.updateRatio(ratio)

progress.dismiss()
```
#### addSubView
```swift
let progress = GradientCircularProgress()

let progressView = progress.showAtRatio(frame: rect, display: true, style: MyStyle())
view.addSubview(progressView!)

progress.updateRatio(ratio)

progress.dismiss(progress: progressView!)
```

### Update Message
#### UIWindow
```swift
let progress = GradientCircularProgress()

progress.show(message: "Download\n0 / 4", MyStyle())

progress.show(message: "Download\n1 / 4", MyStyle())
progress.show(message: "Download\n2 / 4", MyStyle())
progress.show(message: "Download\n3 / 4", MyStyle())
progress.show(message: "Download\n4 / 4", MyStyle())

let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.8 * Double(NSEC_PER_SEC)))
dispatch_after(time, dispatch_get_main_queue()) {
    self.progress.updateMessage(message: "Completed!")
    self.progress.dismiss()
}
```
#### addSubView
```swift
let progress = GradientCircularProgress()

let progressView = progress.show(frame: rect, message: "Download\n0 / 4", style: MyStyle())
view.addSubview(progressView!)

progress.show(message: "Download\n1 / 4", MyStyle())
progress.show(message: "Download\n2 / 4", MyStyle())
progress.show(message: "Download\n3 / 4", MyStyle())
progress.show(message: "Download\n4 / 4", MyStyle())

let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.8 * Double(NSEC_PER_SEC)))
dispatch_after(time, dispatch_get_main_queue()) {
    self.progress.updateMessage(message: "Completed!")
    self.progress.dismiss(progress: progressView!)
}
```

## Download Progress Examples

### NSURLSession

```swift
let progress = GradientCircularProgress()

~~

progress.showAtRatio(style: BlueDarkStyle())
        
let url = NSURL(string: "http://example.com/download/dummy.mp4")
let config = NSURLSessionConfiguration.defaultSessionConfiguration()
let session = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
let task = session.downloadTaskWithURL(url!)
task.resume()

~~

// Delegate
func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    let ratio: CGFloat = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
    progress.updateRatio(ratio)
}
// Delegate
func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
    progress.dismiss()
}
```

### Alamofire

```swift
let progress = GradientCircularProgress()

~~

progress.showAtRatio(style: BlueDarkStyle())

Alamofire.request(.GET, "http://example.com/download/dummy.mp4")
    .response { (request, response, data, error) in
        
        self.progress.dismiss()
}
    .progress { (bytesRead, totalBytesRead, totalBytesExpectedToRead) in
        let ratio: CGFloat = CGFloat(totalBytesRead) / CGFloat(totalBytesExpectedToRead)
        // Call main thread.
        dispatch_async(dispatch_get_main_queue(), {
            self.progress.updateRatio(ratio)
        })
}
```

## API
### Use UIWindow
```swift
public func showAtRatio(display display: Bool = true, style: StyleProperty = Style())

public func show(style style: StyleProperty = Style())

public func show(message message: String, style: StyleProperty = Style())

public func dismiss()

public func dismiss(completionHandler: () -> Void) -> ()
```

### Use addSubView
```swift
public func showAtRatio(frame frame: CGRect, display: Bool = true, style: StyleProperty = Style()) -> UIView?

public func show(frame frame: CGRect, style: StyleProperty = Style()) -> UIView?

public func show(frame frame: CGRect, message: String, style: StyleProperty = Style()) -> UIView?

public func dismiss(progress view: UIView)

public func dismiss(progress view: UIView, completionHandler: () -> Void) -> ()
```

### Common
```swift
public func updateMessage(message message: String)

public func updateRatio(ratio: CGFloat)
```

## License

Gradient Circular Progress is released under the MIT license. See LICENSE for details.

## Author

Yukihiko Kagiyama (keygx) <https://twitter.com/keygx>

