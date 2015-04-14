//
//  uLogin.h
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#define kuLoginLoginSuccess @"uLogin.login.success"
#define kuLoginLoginFail @"uLogin.login.fail"
#define kuLoginLoginCancel @"uLogin.login.cancel"

#import <Foundation/Foundation.h>

#import "ULProviderFacebook.h"
#import "ULProviderFlickr.h"
#import "ULProviderGoogle.h"
#import "ULProviderGuest.h"
#import "ULProviderLastFM.h"
#import "ULProviderLinkedIn.h"
#import "ULProviderLiveID.h"
#import "ULProviderLiveJournal.h"
#import "ULProviderMailRU.h"
#import "ULProviderOdnoklassniki.h"
#import "ULProviderOpenID.h"
#import "ULProviderSoundCloud.h"
#import "ULProviderSteam.h"
#import "ULProviderTwitter.h"
#import "ULProviderVimeo.h"
#import "ULProviderVkontakte.h"
#import "ULProviderWebMoney.h"
#import "ULProviderYandex.h"
#import "ULProviderYouTube.h"
#import "ULProviderFoursquare.h"
#import "ULProviderGooglePlus.h"
#import "ULProviderTumblr.h"

#import "ULDefaultConfigurator.h"
#import "ULWebViewController.h"

typedef void(^ULAuthCompletionBlock)(ULUserProfileData *userProfileData, id<ULProvider> authProvider, NSString *uLoginToken);

@interface uLogin : NSObject {
	UIViewController *rootViewController;
}

@property (nonatomic, copy) ULAuthCompletionBlock authCompletionBlock;

+ (uLogin*)sharedInstance;

-(void)startLogin:(ULDefaultConfigurator*)configurator viewController:(UIViewController*)viewController completion:(ULAuthCompletionBlock)completion;

@end
