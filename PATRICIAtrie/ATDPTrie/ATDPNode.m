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

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:label forKey:@"label"];
    [aCoder encodeObject:subNodes forKey:@"subNodes"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        label = [[aDecoder decodeObjectForKey:@"label"] retain];
        subNodes = [[aDecoder decodeObjectForKey:@"subNodes"] retain];
    }
    return self;
}

-(NSComparisonResult) compare:(ATDPNode *)theNode {
    return [self.label compare:theNode.label];
}

-(void) dealloc {
    self.label = nil;
    [subNodes release];
    [super dealloc];
}

@end
