//
//  ATPAppDelegate.h
//  PATRICIAtrie
//
//  Created by Andrii Titov on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ATDPTrie;

@interface ATPAppDelegate : NSObject <NSApplicationDelegate> {
    
    ATDPTrie *trieTester;
    
}

@property (assign) IBOutlet NSTextField *textField;

@property (assign) IBOutlet NSTextField *label;

@property (assign) IBOutlet NSWindow *window;

-(IBAction)addWord:(id)sender;

-(IBAction)deleteWord:(id)sender;

-(IBAction)lookUpWord:(id)sender;

@end
