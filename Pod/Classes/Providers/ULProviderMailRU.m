//
//  ULMailRU.m
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import "ULProviderMailRU.h"

@implementation ULProviderMailRU

-(NSString *)title{
	return NSLocalizedString(@"Mail.ru", nil);
}

-(NSString *)name{
	return @"mailru";
}

@end