//
//  NSString+Characters.m
//  anagrammer
//
//  Created by Chris O'Malley on 10/27/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import "NSString+Characters.h"

@implementation NSString (Characters)

-(NSSet*)setOfCharacters{
    
    NSUInteger length = [self length];
    unichar stringBuffer[length + 1];
    [self getCharacters:stringBuffer range:NSMakeRange(0, length)];
    
    NSMutableSet* set = [NSMutableSet new];
    
    for (int i=0; i < length; i++){
        [set addObject:[NSString stringWithFormat:@"%c",stringBuffer[i]]];
    }
    
    return set;
    
}

@end
