//
//  AnagramDictionary.h
//  anagrammer
//
//  Created by Chris O'Malley on 10/22/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnagramDictionary : NSObject

-(id)initWithWordSet:(NSSet*)set;
-(NSArray* )anagramsForPhrase:(NSString *)phrase;

@end
