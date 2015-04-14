//
//  ULViewController.h
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ULProvider.h"
#import "ULUserProfileData.h"
#import "ULDefaultConfigurator.h"

@interface ULWebViewController : UIViewController <UIWebViewDelegate> {
    id<ULProvider> currentProvider;
	ULDefaultConfigurator *config;
    
	IBOutlet UIWebView *_webView;
}

+ (ULWebViewController *)instantiate;

- (ULWebViewController*)initWithProvider:(id<ULProvider>)thisProvider
                        andConfigurator:(ULDefaultConfigurator*)thisConfig;

@end