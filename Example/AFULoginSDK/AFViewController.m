//
//  AFViewController.m
//  AFULoginSDK
//
//  Created by Alexander Fedosov on 04/14/2015.
//  Copyright (c) 2014 Alexander Fedosov. All rights reserved.
//

#import "AFViewController.h"
#import "AFULoginSDK.h"

@interface AFViewController ()

@end

@implementation AFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [[uLogin sharedInstance] startLogin:[ULDefaultConfigurator new]
                         viewController:self
                             completion:^(ULUserProfileData *userProfileData, id<ULProvider> authProvider, NSString *uLoginToken) {
                                 
                                 
        
    }];
    
}


@end
