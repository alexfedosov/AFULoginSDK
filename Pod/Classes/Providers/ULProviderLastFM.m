//
//  ULProviderLastFM.m
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import "ULProviderLastFM.h"

@implementation ULProviderLastFM

-(NSString *)title{
	return NSLocalizedString(@"Last.FM", nil);
}

-(NSString *)name{
	return @"lastfm";
}

@end
