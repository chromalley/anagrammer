//
//  TrieNode.m
//  anagrammer
//
//  Created by Chris O'Malley on 10/21/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import "TrieNode.h"

@interface TrieNode ()

@property (nonatomic,readwrite) NSMutableDictionary* children;

@end

@implementation TrieNode

-(id)initWithCharacter:(unichar)character andString:(NSString*)string{
    
    self = [super init];
    
    if (self){
        _character = character;
        _string = string;
        _children = [NSMutableDictionary new];
    }
    return self;
    
}

-(void)addChildTrieNode:(TrieNode*)node{
    
    if (![self containsChildCharacter:node.character]){
        [self.children setValue:node forKey:[NSString stringWithFormat:@"%c",node.character]];
    }
}

-(BOOL)containsChildCharacter:(unichar)character{
   return ([self.children valueForKey:[NSString stringWithFormat:@"%c",character]] != nil);
}

-(TrieNode*)childWithCharacter:(unichar)character{
    return [self.children valueForKey:[NSString stringWithFormat:@"%c",character]];
}

@end
