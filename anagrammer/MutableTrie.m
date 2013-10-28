//
//  MutableTrie.m
//  anagrammer
//
//  Created by Chris O'Malley on 10/21/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import "MutableTrie.h"
#import "TrieNode.h"
#import "NSString+Characters.h"

@interface MutableTrie ()

@end

@implementation MutableTrie

-(id)init{
    self = [super init];
    if (self){
        _root = [[TrieNode alloc] initWithCharacter:'\0' andString:@""];
    }
    return self;
}

-(void)addString:(NSString *)string{
    
    NSUInteger length = [string length];
    unichar stringBuffer[length + 1];
    [[string lowercaseString] getCharacters:stringBuffer range:NSMakeRange(0, length)];

    TrieNode* currentNode = self.root;
    
    for (NSUInteger i = 0; i < length; i ++){
        if (![currentNode containsChildCharacter:stringBuffer[i]]){
            NSString* string = [NSString stringWithFormat:@"%@%c",currentNode.string,stringBuffer[i]];
            TrieNode* newNode = [[TrieNode alloc] initWithCharacter:stringBuffer[i] andString:string];
            [currentNode addChildTrieNode:newNode];
        }
        currentNode = [currentNode.children valueForKey:[NSString stringWithFormat:@"%c",stringBuffer[i]]];
    }
    
    [currentNode setIsValidWord:YES];
}

@end
