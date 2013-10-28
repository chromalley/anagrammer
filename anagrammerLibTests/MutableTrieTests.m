//
//  MutableTrieTests.m
//  MutableTrieTests
//
//  Created by Chris O'Malley on 10/22/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TrieNode.h"
#import "MutableTrie.h"

@interface MutableTrieTests : XCTestCase

@end

@implementation MutableTrieTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

-(void)testTrieAddChildNode{
    TrieNode* rootNode = [[TrieNode alloc] initWithCharacter:'\0' andString:@""];
    TrieNode* childNode = [[TrieNode alloc] initWithCharacter:'b' andString:@"b"];
    [rootNode addChildTrieNode:childNode];
    XCTAssert([rootNode.children valueForKey:@"b"], @"Node was not created successfully");
}

- (void)testChildNodes{
    MutableTrie* mutableTrie = [[MutableTrie alloc] init];
    [mutableTrie addString:@"no"];
    [mutableTrie addString:@"not"];
    [mutableTrie addString:@"on"];
    [mutableTrie addString:@"one"];
    
    NSUInteger rootChildNodes = [[mutableTrie.root.children allKeys] count];
    TrieNode* nNode = [mutableTrie.root.children valueForKey:@"n"];
    NSUInteger nChildNode = [nNode.children count];
    TrieNode* oNode = [mutableTrie.root.children valueForKey:@"o"];
    NSUInteger oChildNode = [oNode.children count];
    
    XCTAssert( rootChildNodes == 2 && nChildNode == 1 && oChildNode == 1, @"Child nodes were not created successfully.");
}

@end
