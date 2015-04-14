//
//  uLogin.m
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import "uLogin.h"
#import "ULProvidersViewController.h"

@implementation uLogin

+(uLogin*)sharedInstance{
    static uLogin* _instance;
    static dispatch_once_t onceToken;
	
    dispatch_once(&onceToken, ^{
        _instance = [[uLogin alloc] init];
    });
	
    return _instance;
}

- (instancetype)init{
    self = [super init];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginComplete:) name:[kuLoginLoginSuccess stringByAppendingString:@".internal"] object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginFail:) name:[kuLoginLoginFail stringByAppendingString:@".internal"] object:nil];
    }
    
    return self;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)startLogin:(ULDefaultConfigurator*)configurator
   viewController:(UIViewController*)viewController
       completion:(ULAuthCompletionBlock)completion{
    
    self.authCompletionBlock = completion;
	
	rootViewController = viewController;
	
	if([configurator providers].count == 0){
		[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Не задан провайдер", nil)
                                    message:NSLocalizedString(@"В экземпляре класса ULDefaultConfigurator должен быть определён как минимум один провайдер", nil)
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
	}
	else if([configurator providers].count == 1){
        id<ULProvider> provider = ((id<ULProvider>)[[configurator providers] firstObject]);
		ULWebViewController *webViewController = [[ULWebViewController instantiate] initWithProvider:provider
                                                                                     andConfigurator:configurator];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:webViewController];
		[viewController presentViewController:navigationController animated:YES completion:^{
            
        }];
	}
	else{
		ULProvidersViewController *providersViewController = [ULProvidersViewController instantiate];
		providersViewController.config = configurator;
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:providersViewController];
        [viewController presentViewController:navigationController animated:YES completion:^{
            
        }];
	}
}

-(void)loginComplete:(NSNotification*)notification{
    
    [rootViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    ULUserProfileData *profile = notification.userInfo[@"profile"];
    id<ULProvider> provider = notification.userInfo[@"provider"];
    NSString *token = notification.userInfo[@"token"];
    
    if (self.authCompletionBlock) {
        self.authCompletionBlock(profile,provider,token);
    }
}

-(void)loginFail:(NSNotification*)notification{
	// Заготовка на кастомный сценарий в будущем
}

@end
