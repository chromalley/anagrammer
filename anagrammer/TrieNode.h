//
//  TrieNode.h
//  anagrammer
//
//  Created by Chris O'Malley on 10/21/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrieNode : NSObject

@property (nonatomic,readonly) unichar character;
@property (nonatomic,readonly) NSString* string;
@property (nonatomic,readonly) NSDictionary* children;
@property (nonatomic,assign) BOOL isValidWord;

-(id)initWithCharacter:(unichar)character andString:(NSString*)string;
-(void)addChildTrieNode:(TrieNode*)node;
-(BOOL)containsChildCharacter:(unichar)character;

@end
