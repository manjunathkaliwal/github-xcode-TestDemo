//
//  Person.h
//  AutoLayout
//
//  Created by Manjunath Kaliwal on 10/20/15.
//  Copyright (c) 2015 Manjunath Kaliwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * fname;
@property (nonatomic, retain) NSString * lname;
@property (nonatomic, retain) NSNumber * stringid;

@end
