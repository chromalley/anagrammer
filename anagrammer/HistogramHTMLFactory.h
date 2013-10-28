//
//  HistogramHTMLFactory.h
//  anagrammer
//
//  Created by Chris O'Malley on 10/28/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistogramHTMLFactory : NSObject

+(NSString *)htmlWithDataArray:(NSArray*)dataArray
            andCategoriesArray:(NSArray*)categoriesArray;

@end
