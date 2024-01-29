# Welcome to Roshetta
Explain Rosetta app in here -> Here we will explain the app architecture, etc

## Architecture
##### App uses MVVM-Clean Architecture 
- **[Example of how to use whith swift](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3)**
- **[Clean Architecture Guide](https://betterprogramming.pub/the-clean-architecture-beginners-guide-e4b7058c1165)**

## Architecture
##### Packages for this app
- [Facebook](https://github.com/facebook/facebook-ios-sdk)
- [GoogleSingin](https://github.com/google/GoogleSignIn-iOS)
##### Get started 
1. clone app
2. - File -> package -> Resolve packages
## Folders Tree

##### Rosheta main Folder Formate
```bash
├── Assets File
│   ├── Assets.xcassets
├── Helpers
│   ├── Fonts.swift
│   ├── Colors.swfit
│   ├── Images.swift
│   ├── SFSymbols.swift
├── Custom Fonts
│   ├── CustomFont.ttf
├── Network
│   ├── API Requests
│   │	├── SFSymbols.swift
│   ├── Request Strategy
│   │	├── SFSymbols.swift
│   ├── Base
│   │	├── BaseAPIClient.swift
├── Managers
│ 	├── Manager.swift
├── Localization
│ 	├── language
└── Rosetta App
```
##### Rossheta App Formate
```bash
├── Components
│   ├── CustomView.swift
├── Custom Modifiers
│   ├── CustomModifire.siwft
├── App
│   ├── Feature *Users*
│   │	├── Network
│   │	│	├── Network
│   │	│	│ 	├── Api Client.swift
│   │	│	│ 	├── Api Request.swift
│   │	│	│ 	├── Models
│   │	│	│ 	│	├── model.swift
│   │	│	├── Repository
│   │	│	│ 	├── RepositoryProtocol.swift
│   │	│	│ 	├── Repository.swift
│   │	│	├── Nested Feture *User, UserDetails*
│   │	│	│ 	├── ModuleFactory.swift
│   │	│	│ 	├── BusinessLogic
│   │	│	│   │ 	├── UseCase
│   │	│	│   │ 	├── DataSource
│   │	│	│ 	├── Presentation.swift
│   │	│	│   │ 	├── View
│   │	│	│   │ 	├── View Model
└── Preview Content
```
