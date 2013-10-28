//
//  AnagramDictionary.m
//  anagrammer
//
//  Created by Chris O'Malley on 10/22/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import "AnagramDictionary.h"
#import "MutableTrie.h"
#import "TrieNode.h"
#import "NSString+Characters.h"
#import "NSString+Replacement.h"

static NSUInteger const kMinimumWordLength = 3;

@interface AnagramDictionary ()

@property (nonatomic,strong) NSSet* wordSet;
@property (nonatomic,strong) MutableTrie* mutableTrie;

@end

@implementation AnagramDictionary

-(id)initWithWordSet:(NSSet *)set{
    
    self = [super init];
    
    if (self){
        
        _wordSet = set;
        _mutableTrie = [[MutableTrie alloc] init];
        for (id word in set){
            if ([word isKindOfClass:[NSString class]]){
                
                if ([word isEqualToString:@""]){
                    continue;
                }
                
                [_mutableTrie addString:word];
            }
        }
        
    }
    
    return self;
}

-(void)anagramsForPhrase:(NSString *)phrase
                    node:(TrieNode*)node
           minimumLength:(NSUInteger)minLength
                anagrams:(NSMutableArray*)anagrams
              curentPath:(NSMutableString*)path{
    
    if ([node isValidWord] && [node.string length] >= kMinimumWordLength){
        
        NSUInteger currentLength = [[path stringByReplacingOccurrencesOfString:@" " withString:@""] length];
        
        if (currentLength >= minLength){
            [anagrams addObject:[path copy]];
            [path setString:@""];
            return;
        } else {
            NSMutableString* nextPath = [path mutableCopy];
            [nextPath appendString:@" "];
            [self anagramsForPhrase:phrase
                               node:self.mutableTrie.root
                      minimumLength:minLength
                           anagrams:anagrams
                         curentPath:nextPath];
        }
        
    }
    
    NSArray* childKeys = [node.children allKeys];
    
    for (NSString* childKey in childKeys ){
        
        NSSet* characters = [phrase setOfCharacters];
        
        if ([characters containsObject:childKey]){
            NSString* newString = [phrase stringByReplacingFirstOccurrencesOfString:childKey
                                                                         withString:@""];
            NSMutableString* nextPath = [path mutableCopy];
            [nextPath appendString:childKey];
            TrieNode* newNode = [node.children valueForKey:childKey];
            
            [self anagramsForPhrase:newString
                               node:newNode
                      minimumLength:minLength
                           anagrams:anagrams
                         curentPath:nextPath];
            
        } else {
            continue;
        }
        
    }
    
}

-(NSArray* )anagramsForPhrase:(NSString *)phrase{
    NSMutableArray* anagrams = [NSMutableArray array];
    
    TrieNode* rootNode = self.mutableTrie.root;
    NSMutableString* path = [NSMutableString new];
    NSString* phraseWithNoWhiteSpace = [phrase stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSUInteger length = [phraseWithNoWhiteSpace length];
    
    [self anagramsForPhrase:phraseWithNoWhiteSpace
                       node:rootNode
              minimumLength:length
                   anagrams:anagrams
                 curentPath:path];
    
    [anagrams removeObject:phrase]; //If input was one word, make sure it doesn't show up in results.
    
    return anagrams;
}

@end
