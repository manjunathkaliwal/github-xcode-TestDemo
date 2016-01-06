//
//  ViewController.m
//  AutoLayout
//
//  Created by Manjunath Kaliwal on 5/12/15.
//  Copyright (c) 2015 Manjunath Kaliwal. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)deleteItems{
    NSFetchRequest *fetch=[NSFetchRequest fetchRequestWithEntityName:@"Person"];
    [fetch setIncludesPropertyValues:NO];
    
    NSError *error=nil;
    NSArray *arr=[self.managedObjectConext executeFetchRequest:fetch error:&error];
    
    for(NSManagedObject *object in arr)
    {
        [self.managedObjectConext deleteObject:object];
    }
    
    if(![self.managedObjectConext save:&error])
    {
        NSLog(@"Falied");
    }
    else
    {
        NSLog(@"Delete success");
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   AppDelegate *appDelegate=(AppDelegate*)[UIApplication sharedApplication].delegate;
    self.managedObjectConext=[appDelegate managedObjectContext];
    
    Person *persone1=[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.managedObjectConext];
    
    persone1.fname=@"AAA";
    persone1.lname=@"BBB";
    [persone1 setAge:[NSNumber numberWithInt:22]];
    persone1.stringid=[NSNumber numberWithInt:100];
    
    NSError *error;
    if(![self.managedObjectConext save:&error])
    {
        NSLog(@"opps error %@",[error localizedDescription]);
    }
    else
    {
        NSLog(@"success");

    }
    
 
    NSFetchRequest *fetchReq=[NSFetchRequest fetchRequestWithEntityName:@"Person"];
    NSArray *arrList=[self.managedObjectConext executeFetchRequest:fetchReq error:&error];
    
    NSLog(@"Person %@",arrList);
    
    for(int i=0;i<[arrList count];i++)
    {
        Person *p=[arrList objectAtIndex:i];
        NSLog(@"Person %@",[p fname]);
        NSLog(@"Person %@",[p lname]);
        NSLog(@"Person %@",[p lname]);
    }
    
    [self performSelector:@selector(deleteItems) withObject:nil afterDelay:5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
