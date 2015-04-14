# AFULoginSDK

[![Version](https://img.shields.io/cocoapods/v/AFULoginSDK.svg?style=flat)](http://cocoapods.org/pods/AFULoginSDK)
[![License](https://img.shields.io/cocoapods/l/AFULoginSDK.svg?style=flat)](http://cocoapods.org/pods/AFULoginSDK)
[![Platform](https://img.shields.io/cocoapods/p/AFULoginSDK.svg?style=flat)](http://cocoapods.org/pods/AFULoginSDK)

## О SDK

SDK предназначена для интеграции в iOS приложения разработчиками мобильных приложений.<br>
Поддерживаются все социальные сети, реализуемые uLogin. Этот под является более удобной оберткой вокруг оригинального SDK от uLogin https://github.com/ulogin/iOS

## Использование

Чтоб запустить тестовый проект клонируйти репо, выполните `pod install` из папки Example. Пример использования можно найти в AFViewController:

```objc
    [[uLogin sharedInstance] startLogin:[ULDefaultConfigurator new]
                         viewController:self
                             completion:^(ULUserProfileData *userProfileData, id<ULProvider> authProvider, NSString *uLoginToken) {
    // блок вызывается в случае удачной авторизации
    }];
```

## Установка

AFULoginSDK доступен через [CocoaPods](http://cocoapods.org). Чтобы установить - просто добавьте в Podfile

```ruby
pod "AFULoginSDK"
```

## Author

Alexander Fedosov, alexander.a.fedosov@gmail.com

## License

AFULoginSDK is available under the MIT license. See the LICENSE file for more info.
