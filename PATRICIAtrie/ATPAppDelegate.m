//
//  ATPAppDelegate.m
//  PATRICIAtrie
//
//  Created by Andrii Titov on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ATPAppDelegate.h"
#import "ATDPTrie.h"

@implementation ATPAppDelegate

@synthesize label, textField;

@synthesize window = _window;

- (void)dealloc
{
    [trieTester release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    trieTester = [[ATDPTrie alloc] init];
}

-(IBAction)addWord:(id)sender {
    [trieTester insertWord:self.textField.stringValue];
}

-(IBAction)deleteWord:(id)sender {
    [trieTester deleteWord:self.textField.stringValue];
}

-(IBAction)lookUpWord:(id)sender {
    NSString *value;
    if ([trieTester lookupWord:self.textField.stringValue]) {
        value = @"YES";
    }
    else {
        value = @"NO";
    }
    self.label.stringValue = value;
}

@end
