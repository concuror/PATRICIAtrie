//
//  ATDPTrie.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ATDPNode;

@interface ATDPTrie : NSObject {
    
    ATDPNode *_root;
    
}

-(void) insertWord:(NSString *)word;

-(NSString *)findSuccessor:(NSString *)word;

-(NSString *)findPredecessor:(NSString *)word;

-(BOOL)lookupWord:(NSString *)word;

-(void) deleteWord:(NSString *)label;

@end
