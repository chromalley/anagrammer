//
//  MutableTrie.h
//  anagrammer
//
//  Created by Chris O'Malley on 10/21/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrieNode;
@interface MutableTrie : NSObject

@property (nonatomic,strong) TrieNode* root;

-(void)addString:(NSString*)string;

@end
