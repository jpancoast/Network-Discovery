//
//  main.m
//  Network-Discovery
//
//  Created by James Pancoast on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bonjour-discovery.h"
#import "SSDP_Discovery.h"



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        /*
         *  Bonjour Discovery
         */
        /*
        bonjour_discovery *temp = [ [ bonjour_discovery alloc ] init ];
        
        NSLog( @"blah 1" );
        [ temp browseServices ];
        CFRunLoopRun();
        //Could probably put this part in GCD or something instead of using CFRunLoopRun()
        NSLog( @"blah 2" );
        */
        
        
        /*
         *  SSDP Discovery
         */
        SSDP_Discovery *ssdpDiscovery = [ [ SSDP_Discovery alloc ] init ];
        
        
        
        /*
         *  DLNA (?) discovery (Not working on this yet)
         */
        
    }
    return 0;
}

