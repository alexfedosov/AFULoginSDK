//
//  ULDefaultConfigurator.m
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import "ULDefaultConfigurator.h"
#import "uLogin.h"

@implementation ULDefaultConfigurator

-(NSSet*)fields{
	return [NSSet setWithObjects:@"first_name", @"last_name", @"nickname", @"email", @"sex", @"country", @"city", @"bdate", @"profile", @"photo_big", nil];
}

-(NSSet*)optional{
	return [NSSet setWithObjects:@"photo", @"phone", nil];
}

-(NSString*)client{
	return @"undefined";
}

-(NSString*)clientSecret{
	return @"";
}

-(NSArray *)providers{
    ULProviderGoogle         *googleProv = [[ULProviderGoogle        alloc] init];
    ULProviderVkontakte          *vkProv = [[ULProviderVkontakte     alloc] init];
    ULProviderOdnoklassniki    *odnoProv = [[ULProviderOdnoklassniki alloc] init];
    ULProviderMailRU         *mailruProv = [[ULProviderMailRU        alloc] init];
    ULProviderFacebook     *facebookProv = [[ULProviderFacebook      alloc] init];
    ULProviderTwitter       *twitterProv = [[ULProviderTwitter       alloc] init];
    ULProviderYandex         *yandexProv = [[ULProviderYandex        alloc] init];
    ULProviderLiveJournal        *ljProv = [[ULProviderLiveJournal   alloc] init];
    ULProviderOpenID         *openidProv = [[ULProviderOpenID        alloc] init];
    ULProviderFlickr         *flickrProv = [[ULProviderFlickr        alloc] init];
    ULProviderLastFM         *lastfmProv = [[ULProviderLastFM        alloc] init];
    ULProviderLinkedIn     *linkedinProv = [[ULProviderLinkedIn      alloc] init];
    ULProviderLiveID         *liveidProv = [[ULProviderLiveID        alloc] init];
    ULProviderSoundCloud *soundcloudProv = [[ULProviderSoundCloud    alloc] init];
    ULProviderSteam           *steamProv = [[ULProviderSteam         alloc] init];
    ULProviderYouTube       *youtubeProv = [[ULProviderYouTube       alloc] init];
    ULProviderVimeo           *vimeoProv = [[ULProviderVimeo         alloc] init];
    ULProviderWebMoney     *webmoneyProv = [[ULProviderWebMoney      alloc] init];
    ULProviderFoursquare *foursquareProv = [[ULProviderFoursquare    alloc] init];
    ULProviderGooglePlus *googleplusProv = [[ULProviderGooglePlus    alloc] init];
    ULProviderTumblr		 *tumblrProv = [[ULProviderTumblr        alloc] init];
    
    return [NSArray arrayWithObjects:googleProv,vkProv,odnoProv,mailruProv,facebookProv,twitterProv,yandexProv,ljProv,openidProv,flickrProv,lastfmProv,linkedinProv,liveidProv,soundcloudProv,steamProv,youtubeProv,vimeoProv,webmoneyProv,foursquareProv,googleplusProv,tumblrProv,nil];
}

-(NSURL*)apiURL:(id<ULProvider>)provider{
    NSString *url = @"https://ulogin.ru/auth.php?name=";
    url = [url stringByAppendingString:[provider name]];
    url = [url stringByAppendingString:@"&window=0&lang=ru"];
    url = [url stringByAppendingString:[@"&app_id=" stringByAppendingString:self.client]];
    url = [url stringByAppendingString:[@"&secret_key=" stringByAppendingString:self.clientSecret]];
    url = [url stringByAppendingString:@"&fields="];
    url = [url stringByAppendingString:[[[self fields] allObjects] componentsJoinedByString:@","]];
    url = [url stringByAppendingString:@"&optional="];
    url = [url stringByAppendingString:[[[self optional] allObjects] componentsJoinedByString:@","]];
    url = [url stringByAppendingString:@"&mid="];
    url = [url stringByAppendingString:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    url = [url stringByAppendingString:@"&redirect_uri=https%3A%2F%2Fulogin.ru%2Fxd_receiver.html&callback=preview&screen=1920x1080&host=ulogin.ru&verify=&q=https%3A%2F%2Fulogin.ru%2F%3Fid%3D%26display%3D%26redirect_uri%3Dhttps%253A%252F%252Fulogin.ru%252Fxd_receiver.html%26callback%3D%26providers%3D%26fields%3D%26optional%3D%26othprov%3D%26protocol%3Dhttps%26host%3Dulogin.ru%26lang%3Dru%26verify%3D%26xdm_e%3Dhttps%253A%252F%252Fulogin.ru"];
    
    return [NSURL URLWithString:url];
}

@end
