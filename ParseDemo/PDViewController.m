//
//  PDViewController.m
//  ParseDemo
//
//  Created by Joshua Howland on 6/25/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PDViewController.h"
#import "Entry.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>

static NSString * const entryNameKey = @"name";

@interface PDViewController ()

@property (nonatomic, strong) PFUser *currentUser;

@property (nonatomic, strong) IBOutlet UITextField *objectNameField;
@property (nonatomic, strong) IBOutlet UILabel *objectNameLabel;

@end

@implementation PDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    
}

- (IBAction)storeObject:(id)sender {
    
    Entry *entry = [Entry object];
    entry.name = self.objectNameField.text;
    
    [entry saveEventually];
    // (this is for when you’re using LocalDataStore.  Parse will save it locally and then save it to the database when it’s convenient)
    
//    // the most common one to use, though is this one:
//    [entry saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        // code to execute after the save is done (update the UI with a message or something saying: "save successful," or "save succeeded”)
//        
//    } ];
    

}

- (IBAction)retrieveObject:(id)sender {
    
    PFQuery *query = [Entry query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *entries, NSError *error) {
        
    }];

}

- (IBAction)signIn:(id)sender {

}

- (IBAction)signUp:(id)sender {

}

- (void)addUserData {

}

@end
