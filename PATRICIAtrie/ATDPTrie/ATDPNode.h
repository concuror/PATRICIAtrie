//
//  ATDPNode.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATDPNode : NSObject {
    
    NSString *label;
    
    NSMutableArray *subNodes;
    
}

@property (nonatomic, retain) NSString *label;

@property (assign) NSMutableArray *subNodes;

-(id) initWithLabel:(NSString *)label;

@end
