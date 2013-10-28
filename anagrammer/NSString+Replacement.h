//
//  NSString+Replacement.h
//  anagrammer
//
//  Created by Chris O'Malley on 10/27/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Replacement)

-(NSString*)stringByReplacingFirstOccurrencesOfString:(NSString *)target withString:(NSString *)replacement;

@end
