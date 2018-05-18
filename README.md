# trenddit 🎯

## Overview
Whether it's the Eagles, yoga, or CardiB that you care about, there's a subTrenddit for you! Share your opinion with others across the world and get a chance to vote on the best comments.

## Screenshots

<p align="middle">
<img src="https://user-images.githubusercontent.com/27717536/40210228-bcdcac46-5a11-11e8-9bf7-a5d6c5c20f6f.jpeg" width="180">
<img src="https://user-images.githubusercontent.com/27717536/40210234-c3589e0e-5a11-11e8-9b0f-8f1378ffbc3d.jpeg" width="180">
<img src="https://user-images.githubusercontent.com/27717536/40210237-c55fed06-5a11-11e8-8e2e-5fd7179fdcd0.jpeg" width="180">
</p>

## Features
Users can: 
- create a custom profile, set the image and username
- Post Images with a title 
- Vote for comments: You can upvote or downvote comments and pictures 
- view all of the previous posts and votes in the profile

## Requirements
- iOS 8.0+ / Mac OS X 10.11+ / tvOS 9.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

### CocoaPods
CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:

`$ sudo gem install cocoapods`

### Pods
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SnapKit](http://snapkit.io/docs)
- [KingFisher](https://github.com/onevcat/Kingfisher)
- [Firebase](https://firebase.google.com)
	- Firebase/Core
	- Firebase/Auth
	- Firebase/Database

### How to Install Pods
To integrate these pods into your Xcode project using CocoaPods, specify it in your Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'Alamofire',
    pod 'SnapKit',
    pod 'KingFisher'
end
```

Then, run the following command in Terminal:

`$ pod install`

## Collaborators
- **Project Manager**: Tristan Myers 
- **Tech Lead**: Kaniz Ali  
- **QA**: Masai Young
- **UI/UX**: Clint Mejia  
- **Flex**: Ashlee Krammer
