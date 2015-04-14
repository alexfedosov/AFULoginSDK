//
//  ULProviderFacebook.m
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import "ULProviderFacebook.h"

@implementation ULProviderFacebook

-(NSString *)title{
	return NSLocalizedString(@"Facebook", nil);
}

-(NSString *)name{
	return @"facebook";
}

@end