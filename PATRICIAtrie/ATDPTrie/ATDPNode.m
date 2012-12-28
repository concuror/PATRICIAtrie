//    Copyright 2012 Andrii Titov
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

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
