//
//  ATDPTrie.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ATDPTrie.h"
#import "ATDPNode.h"

@implementation ATDPTrie

-(id)init {
    self = [super init];
    if (self) {
        _root = [[ATDPNode alloc] initWithLabel:@""];
    }
    return self;
}

-(NSInteger) matchConsecutiveChars:(NSString *)word inNode:(ATDPNode *)curNode {
    NSInteger matches = 0;
    NSInteger minLength = MIN(curNode.label.length, word.length);
    for (NSInteger i = 0; i < minLength; ++i) {
        if ([word characterAtIndex:i] == [curNode.label characterAtIndex:i]) {
            ++matches;
        } 
        else {
            break;
        }
    }
    return matches;
}

-(void) insertWord:(NSString *)wordPart inNode:(ATDPNode *)curNode {
    NSInteger matches = [self matchConsecutiveChars:wordPart inNode:curNode];
    if (
        (matches == 0) || 
        (curNode == _root) || 
        ((matches > 0) && (matches == [curNode.label length]) && (matches < [wordPart length]))
        ) {
        BOOL inserted = NO;
        NSString *newWordPart = [wordPart substringFromIndex:matches];
        for (ATDPNode *child in curNode.subNodes) {
            if ([child.label hasPrefix:[newWordPart substringToIndex:1]]) {
                inserted = YES;
                [self insertWord:newWordPart inNode:child];
                break;
            }
        }
        if ( ! inserted ) {
            ATDPNode *tempNode = [[ATDPNode alloc] initWithLabel:newWordPart];
            [curNode.subNodes addObject:tempNode];
            [tempNode release];
        }
    }
    else if (
             (matches < [wordPart length]) &&
             (matches < [curNode.label length])
             ) {
        NSString *newLabel1 = [wordPart substringFromIndex:matches];
        NSString *newLabel2 = [curNode.label substringFromIndex:matches];
        curNode.label = [curNode.label substringToIndex:matches];
        ATDPNode *sibling1 = [[ATDPNode alloc] initWithLabel:newLabel1];
        ATDPNode *sibling2 = [[ATDPNode alloc] initWithLabel:newLabel2];
        sibling2.subNodes = curNode.subNodes;
        curNode.subNodes = [[NSMutableArray alloc] initWithObjects:sibling1,sibling2, nil];
        [sibling1 release];
        [sibling2 release];
    }
}

-(NSString *)findSuccessor:(NSString *)wordPart inNode:(ATDPNode *)node withCarry:(NSString *)carry {
    return nil;
}

-(NSString *)findPredecessor:(NSString *)wordPart inNode:(ATDPNode *)node withCarry:(NSString *)carry {
    return nil;
}

-(BOOL)lookupWord:(NSString *)wordPart inNode:(ATDPNode *)curNode {
    NSInteger matches = [self matchConsecutiveChars:wordPart inNode:curNode];
    
    if (
        (curNode == _root) || 
        ((matches > 0) && (matches == [curNode.label length]) && (matches < [wordPart length]))
        ) {
        NSString *newWordPart = [wordPart substringFromIndex:matches];
        for (ATDPNode *child in curNode.subNodes) {
            if ([child.label hasPrefix:[newWordPart substringToIndex:1]]) {
                return [self lookupWord:newWordPart inNode:child];
            }
        }
        return NO;
    }
    else if (matches == [curNode.label length]) {
        return YES;
    }
    return NO;
}

-(void) deleteWord:(NSString *)wordPart inNode:(ATDPNode *)curNode {
    NSInteger matches = [self matchConsecutiveChars:wordPart inNode:curNode];
    
    if (
        (curNode == _root) || 
        ((matches > 0) && (matches == [curNode.label length]) && (matches < [wordPart length]))
        ) {
        NSString *newWordPart = [wordPart substringFromIndex:matches];
        for (ATDPNode *child in curNode.subNodes) {
            if ([child.label hasPrefix:[newWordPart substringToIndex:1]]) {
                if ([newWordPart isEqualToString:child.label]) {
                    if ([child.subNodes count] == 0) {
                        [curNode.subNodes removeObject:child];
                        return;
                    }
//                    else {
//                        
//                    }
                }
                [self deleteWord:newWordPart inNode:child];
                break;
            }
        }
    }
}

-(void) insertWord:(NSString *)word {
    [self insertWord:word inNode:_root];
}

-(NSString *)findSuccessor:(NSString *)word {
    return [self findSuccessor:word inNode:_root withCarry:@""];
}

-(NSString *)findPredecessor:(NSString *)word {
    return [self findPredecessor:word inNode:_root withCarry:@""];
}

-(BOOL)lookupWord:(NSString *)word {
    return [self lookupWord:word inNode:_root];
}

-(void) deleteWord:(NSString *)label {
    [self deleteWord:label inNode:_root];
}

-(void) dealloc {
    [_root release];
    [super dealloc];
}

@end
