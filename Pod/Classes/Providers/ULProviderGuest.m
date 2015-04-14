//
//  ULProviderGuest.m
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import "ULProviderGuest.h"

@implementation ULProviderGuest

-(NSString *)title{
	return NSLocalizedString(@"Guest", nil);
}

-(NSString *)name{
	return @"guest";
}

@end
