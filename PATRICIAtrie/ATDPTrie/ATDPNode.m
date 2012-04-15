//
//  ATDPNode.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import "ATDPNode.h"

@implementation ATDPNode

@synthesize label, subNodes;

-(id) init {
    self = [super init];
    if (self) {
        label = nil;
        subNodes = [[NSMutableArray alloc] init];
    }
    return self;
}

-(id) initWithLabel:(NSString *)lbl {
    self = [super init];
    if (self) {
        self.label = lbl;
        subNodes = [[NSMutableArray alloc] init];        
    }
    return self;
}

-(void) dealloc {
    self.label = nil;
    [subNodes release];
    [super dealloc];
}

@end
