//
//  ULProvidersViewController.m
//
//  Created by Alexey Talkan on 10.04.13.
//  Copyright (c) 2013 Alexey Talkan. All rights reserved.
//

#import "ULProvidersViewController.h"
#import "ULProvider.h"

@interface ULProvidersViewController ()

@end

@implementation ULProvidersViewController

@synthesize config;

+ (ULProvidersViewController *)instantiate{
    
    NSBundle *podBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"AFULoginSDK" ofType:@"bundle"]];
    
    return [[UIStoryboard storyboardWithName:@"ULogin" bundle:podBundle] instantiateViewControllerWithIdentifier:@"ULProvidersViewController"];
}

-(IBAction)backButtonClick:(id)sender{
	[self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return config.providers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];

	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
	}
		
	cell.textLabel.text = ((id<ULProvider>)[config.providers objectAtIndex:indexPath.row]).title;

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ULWebViewController *webViewController = [[ULWebViewController instantiate] initWithProvider:((id<ULProvider>)[config.providers objectAtIndex:indexPath.row]) andConfigurator:config];
	[self.navigationController pushViewController:webViewController animated:YES];
}

@end

