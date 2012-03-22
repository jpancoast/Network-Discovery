//
//  main.m
//  Network-Discovery
//
//  Created by James Pancoast on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bonjour-discovery.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        bonjour_discovery *temp = [ [ bonjour_discovery alloc ] init ];
        
        [ temp testingBitches ];
        
    }
    return 0;
}

