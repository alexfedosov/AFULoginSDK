//
//  ULDefaultConfigurator.h
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ULProvider.h"

@interface ULDefaultConfigurator : NSObject

-(NSSet*)fields;
-(NSSet*)optional;

-(NSString*)client;
-(NSString*)clientSecret;

-(NSArray*)providers;

-(NSURL*)apiURL:(id<ULProvider>)provider;

@end
