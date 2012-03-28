//
//  bonjour-discovery.h
//  Network-Discovery
//
//  Created by James Pancoast on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface bonjour_discovery : NSObject < NSNetServiceBrowserDelegate, NSNetServiceDelegate >
{
    NSNetServiceBrowser *browser;
}


@property (readwrite, strong ) NSNetServiceBrowser *browser;
@property (readwrite, strong ) NSMutableArray *services;

@property( nonatomic, strong ) NSString *listOfDevices;



-( void ) testingBitches;
-(void) browseServices;

@end
