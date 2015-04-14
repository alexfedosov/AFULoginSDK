//
//  ULViewController.m
//  uLoginTestApp
//
//  
//  Copyright (c) 2012 easy-pro.ru All rights reserved.
//

#import "ULWebViewController.h"
#import "ConnectionErrors.h"
#import "uLogin.h"
#import "SVProgressHUD.h"

@implementation ULWebViewController

+ (ULWebViewController *)instantiate{

    NSBundle *podBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"AFULoginSDK" ofType:@"bundle"]];
    
    return [[UIStoryboard storyboardWithName:@"ULogin" bundle:podBundle] instantiateViewControllerWithIdentifier:@"ULWebViewController"];
}

-(ULWebViewController*)initWithProvider:(id<ULProvider>)thisProvider andConfigurator:(ULDefaultConfigurator*)thisConfig {
	currentProvider = thisProvider;
	config = thisConfig;

	return self;
}

-(void)viewWillAppear:(BOOL)animated{
	self.title = [currentProvider title];
}
-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
    
	NSLog(@"URL: %@", [config apiURL:currentProvider]);
    [_webView loadRequest:[[NSURLRequest alloc] initWithURL:[config apiURL:currentProvider]]];
}

-(IBAction)backButtonClicked:(id)sender {
	[self dismiss];
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Web view delegate

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD showWithStatus:@"Загрузка"];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD dismiss];
    [[[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
	[self dismiss];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
	
	NSString *currentURL = webView.request.URL.absoluteString;
	NSLog(@"%@", currentURL);
	
    NSString* uLoginState = [webView stringByEvaluatingJavaScriptFromString:@"ulogin_state"];
    NSString* token = [webView stringByEvaluatingJavaScriptFromString:@"token"];
	NSLog(@"uLoginState: %@\nToken: %@", uLoginState, token);
	
	if([token length] > 0){
		[self loadProfileByToken:token];
	}
}

#pragma mark - Token methods

-(void)loadProfileByToken:(NSString*)token {
    
    NSString *urlAddress = [@"http://ulogin.ru/token.php?token=" stringByAppendingString:token];
	NSError* error = nil;
	NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlAddress] options:NSDataReadingUncached error:&error];

    void(^errorBlock)(NSError *) = ^(NSError *error){
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Ошибка", nil) message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        [self dismiss];
    };
    
	if(error){
        errorBlock(error);
        return;
	}
	
	ULUserProfileData *profile = [[ULUserProfileData alloc] initWithData:data];
	if( [profile Error] == nil ) {
        
        NSDictionary *userInfo = @{
                                   @"profile" : profile,
                                   @"provider" : currentProvider,
                                   @"token" : token
                                   };
		[[NSNotificationCenter defaultCenter] postNotificationName:[kuLoginLoginSuccess stringByAppendingString:@".internal"]
                                                            object:self
                                                          userInfo:userInfo];
	}
	else {
        errorBlock([NSError errorWithDomain:@"" code:0 userInfo:@{NSLocalizedDescriptionKey : [profile Error]}]);
        return;
	}
}


@end
