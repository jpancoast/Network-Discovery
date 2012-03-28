//
//  bonjour-discovery.m
//  Network-Discovery
//
//  Created by James Pancoast on 3/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "bonjour-discovery.h"
#import <arpa/inet.h>

@implementation bonjour_discovery

@synthesize browser;
@synthesize services;
@synthesize listOfDevices;


-( void ) testingBitches
{
    NSLog( @"testingBitches" );
}


- (id)init
{
    NSLog( @"init" );
    
    self = [ super init ];
    if (self) {
        // Custom initialization
    }
    return self;
}



//---resolve the IP address of a service---
/*
-(void) resolveIPAddress:(NSNetService *)service {    
    NSNetService *remoteService = service;
    remoteService.delegate = self;
    [remoteService resolveWithTimeout:0];
}
*/


//---browse for services---

-(void) browseServices {
    NSLog( @"Bonjour: browseServices" );
    services = [NSMutableArray new];
    self.browser = [[NSNetServiceBrowser alloc ] init ];
    
    self.browser.delegate = self;
    
    
//     NSNetServiceBrowser
//     searchForServicesOfType: @"_services._dns-sd._udp." 
//     inDomain:                @""
     
    [self.browser searchForServicesOfType:@"_ssh._tcp." inDomain:@""];
    //[ self.browser searchForServicesOfType: @"_services._dns-sd._udp" inDomain: @"" ];  //This type is used to discover all services being advertised.  You then have to do the call again to see who's advertising it.
}


//---services found---
/*
 (if you want a specific domain then set domain appropriately) In the didFindService callback, only the name, type, and domain will be valid fields in the NSNetService. You then want to transform these three fields into a servicetype and servicedomain for feeding into another NSNetServiceBrowser to find all the actual services. For local services the three fields will be of the form:
 
 http://fernlightning.com/doku.php?id=randd:bonjour
 */

-(void)netServiceBrowser:(NSNetServiceBrowser *)aBrowser
          didFindService:(NSNetService *)aService
              moreComing:(BOOL)more {
    [services addObject:aService];
    
    NSLog( @"Bonjour: Found Service.  Resolving... Name: %@, type: %@, domain: %@", [ aService name ], [aService type ], [aService domain ] );
    
    NSString *tempString = [ NSString stringWithFormat: @"Bonjour: Found Service.  Resolving... Name: %@, type: %@, domain: %@", [ aService name ], [aService type ], [aService domain ] ];
    
    
    //self.listOfDevices = [ self.listOfDevices stringByAppendingString: tempString ];
    //self.listOfDevices = [ NSString stringWithFormat: @"%@\n%@", self.listOfDevices, tempString ];
    if ( self.listOfDevices == nil )
        self.listOfDevices = tempString;
    else
        self.listOfDevices = [ NSString stringWithFormat: @"%@\n%@", self.listOfDevices, tempString ];
    
    CFRunLoopStop(CFRunLoopGetCurrent());

    
    NSLog( @"Blah22: %@", self.listOfDevices );
    
    //    [self resolveIPAddress:aService];//Commented out because the call is just getting the services being advertised, so there isn't an ip address.  If we search for a specific service, like _ssh., then we should be able to do this call.
}



//---services removed from the network---

-(void)netServiceBrowser:(NSNetServiceBrowser *)aBrowser
        didRemoveService:(NSNetService *)aService
              moreComing:(BOOL)more {
    [services removeObject:aService];
    
    NSLog( @"Bonjour: Removed: %@", [aService hostName] );
}



//---managed to resolve---

-(void)netServiceDidResolveAddress:(NSNetService *)service {
    NSString           *name = nil;
    NSData *address = nil;
    
    struct sockaddr_in *socketAddress = nil;
    
    NSString *ipString = nil;
    
    int port;
    
    NSLog( @"BLAH netService" );
    
    for(int i=0;i < [[service addresses] count]; i++ )
    {
        name = [service name];
        address = [[service addresses] objectAtIndex: i];
        socketAddress = (struct sockaddr_in *) [address
                                                bytes];
        ipString = [NSString stringWithFormat: @"%s", inet_ntoa(socketAddress->sin_addr)];
        
        port = socketAddress->sin_port;
  
        NSLog( @"blah blah blha" );
//        NSLog( @"Bonjour: Resolved: %@-->%@:%hu\n", [service hostName], ipString, port );
    }
    
//    CFRunLoopStop(CFRunLoopGetCurrent());
}




- (void)netService:(NSNetService *)sender didUpdateTXTRecordData:(NSData *)data
{
    NSLog( @"Bonjour: we're getting back txt record data, wonder what it is?" );
}



//---did not managed to resolve---

-(void)netService:(NSNetService *)service didNotResolve:(NSDictionary *)errorDict {
    NSLog( @"Bonjour: Could Not Resolve: %@", errorDict );
}
 

@end
