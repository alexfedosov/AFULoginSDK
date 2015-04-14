//
//  ULOpenID.m
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import "ULProviderOpenID.h"

@implementation ULProviderOpenID

-(NSString *)title{
	return NSLocalizedString(@"OpenID", nil);
}

-(NSString *)name{
	return @"openid";
}

@end
