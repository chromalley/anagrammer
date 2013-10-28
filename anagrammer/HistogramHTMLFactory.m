//
//  HistogramHTMLFactory.m
//  anagrammer
//
//  Created by Chris O'Malley on 10/28/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import "HistogramHTMLFactory.h"

@implementation HistogramHTMLFactory

+(NSString *)htmlWithDataArray:(NSArray*)dataArray
            andCategoriesArray:(NSArray*)categoriesArray
{
    
    if (![dataArray count] ||
        ![categoriesArray count] ||
        [dataArray count] != [categoriesArray count]){
        return nil;     //Data is invalid.
    }
    
    //If the categories are strings, we have to add ' ' for proper html formatting
    NSMutableArray* formattedCategorites = [NSMutableArray new];
    for (id item in categoriesArray){
        
        if ([item isKindOfClass:[NSString class]]){
            [formattedCategorites addObject:[NSString stringWithFormat:@"'%@'",item]];
        } else {
            [formattedCategorites addObject:item];
        }
        
    }
    
    NSString* html = [NSString stringWithFormat:@""
                      @"<html>\n"
                      @"<head>\n"
                      @"<title>Anagrammer results</title>\n"
                      @"<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js\"></script>\n"
                      @"<script src=\"http://code.highcharts.com/highcharts.js\"></script>\n"
                      @"<style type=\"text/css\">\n"
                      @"    #histo {\n"
                      @"       position: absolute;\n"
                      @"       left: 10px;\n"
                      @"       right: 10px;\n"
                      @"       top: 10px;\n"
                      @"       bottom: 10px;\n"
                      @"}\n"
                      @"</style>\n"
                      @"<script type=\"text/javascript\">\n"
                      @"$(document).ready(function() {\n"
                      @"    $('#histo').highcharts({\n"
                      @"    title: {\"text\": \"Anagrammer Results\"},\n"
                      @"    series: [ {\n"
                      @"        \"data\": [%@],\n"
                      @"    }"
                      @"             ],"
                      @"    chart: {\"type\": \"column\", \"backgroundColor\": \"#e1e1d7\"},\n"
                      @"    plotOptions: {\n"
                      @"    column: {\n"
                      @"        color: \"#89a54e\", \"pointPadding\": 0, \"shadow\": false, \"groupPadding\": 0, \"borderWidth\": 0}\n"
                      @"    },\n"
                      @"    xAxis: {\n"
                      @"        categories: [%@]},\n"
                      @"    legend: {enabled: false}\n"
                      @"    });\n"
                      @"});\n"
                      @"</script>\n"
                      
                      @"</head>\n"
                      
                      @"<body bgcolor=\"#ababa3\">\n"
                      @"<div id=\"histo\"></div>\n"
                      
                      @"</body>\n"
                      @"</html>\n",
                      [dataArray componentsJoinedByString:@","],
                      [formattedCategorites componentsJoinedByString:@","] ];
    
    NSString* path = [[NSFileManager defaultManager] currentDirectoryPath];
    NSString* fileName = [path stringByAppendingPathComponent:@"results.html"];
    NSError *error;
    BOOL succeed = [html writeToFile:fileName
                              atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!succeed){
        return nil;
    }
    
    return fileName;
    
}


@end
