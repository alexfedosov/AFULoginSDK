//
//  ULUserProfileData.m
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import "ULUserProfileData.h"

@implementation ULUserProfileData

-(id) initWithData:(NSData*)Data{
    if(self = [super init])
    {
        NSDictionary *tempDictionaryRawData = [NSJSONSerialization JSONObjectWithData:Data options:0 error:nil];
		dictionaryRawData = [NSMutableDictionary dictionary];
		for(NSString *curKey in [tempDictionaryRawData allKeys]) {
			NSString *value = [tempDictionaryRawData objectForKey:curKey];
			if([value length] > 0){
				[dictionaryRawData setValue:value forKey:curKey];
			}
		}
		NSLog(@"User Data: %@", dictionaryRawData);
    }
    return self;
}

-(NSDictionary *)getRawData{
	return dictionaryRawData;
}

-(NSString*)FirstName {
    NSString* result = [dictionaryRawData valueForKey:@"first_name"];
    return result;
}
-(NSString*)LastName {
    NSString* result = [dictionaryRawData valueForKey:@"last_name"];
    return result;
}
-(NSString*)Nickname {
    NSString* result = [dictionaryRawData valueForKey:@"nickname"];
    return result;
}
-(NSString*)Sex {
    NSString* result = [dictionaryRawData valueForKey:@"sex"];
    return result;
}
-(NSString*)BDate {
    NSString* result = [dictionaryRawData valueForKey:@"bdate"];
    return result;
}
-(NSString*)Country {
    NSString* result = [dictionaryRawData valueForKey:@"country"];
    return result;
}
-(NSString*)Photo {
    NSString* result = [dictionaryRawData valueForKey:@"photo"];
    return result;
}
-(NSString*)PhotoBig {
    NSString* result = [dictionaryRawData valueForKey:@"photo_big"];
    return result;
}
-(NSString*)Email {
    NSString* result = [dictionaryRawData valueForKey:@"email"];
    return result;
}
-(NSString*)Identity {
    NSString* result = [dictionaryRawData valueForKey:@"identity"];
    return result;
}
-(NSString*)Profile {
    NSString* result = [dictionaryRawData valueForKey:@"profile"];
    return result;
}
-(NSString*)UID {
    NSString* result = [dictionaryRawData valueForKey:@"uid"];
    return result;
}
-(NSString*)Manual {
    NSString* result = [dictionaryRawData valueForKey:@"manual"];
    return result;
}
-(NSString*)VerifiedEmail {
    NSString* result = [dictionaryRawData valueForKey:@"verified_email"];
    return result;
}
-(NSString*)AccessToken {
    NSString* result = [dictionaryRawData valueForKey:@"access_token"];
    return result;
}
-(NSString*)Error {
    NSString* result = [dictionaryRawData valueForKey:@"error"];
    return result;
}

@end
