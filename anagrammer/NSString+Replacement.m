//
//  NSString+Replacement.m
//  anagrammer
//
//  Created by Chris O'Malley on 10/27/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import "NSString+Replacement.h"

@implementation NSString (Replacement)

-(NSString*)stringByReplacingFirstOccurrencesOfString:(NSString *)target withString:(NSString *)replacement{
    NSRange range = [self rangeOfString:target];
    
    if (range.location == NSNotFound){
        return self;
    }
    
   return [self stringByReplacingCharactersInRange:range withString:replacement];
}

@end
