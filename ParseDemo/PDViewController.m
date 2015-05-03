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

@interface PDViewController () <PFSignUpViewControllerDelegate, PFLogInViewControllerDelegate>

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
    
    PFLogInViewController *logIn = [PFLogInViewController new];
    logIn.delegate = self;
    [self presentViewController:logIn animated:YES completion:nil];
        
    }


- (IBAction)signUp:(id)sender {
    
    PFSignUpViewController *signUp = [PFSignUpViewController new];
    signUp.delegate = self;
    [self presentViewController:signUp animated:YES completion:nil];
    

}

- (void)addUserData {
    
    PFQuery *query = [PFQuery queryWithClassName:@"yourData"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if ([objects count] == 0) {
            
            PFObject *yourData = [PFObject objectWithClassName:@"yourData"];
            yourData[@"dictionaryKey"] = @"dictionaryValue";
            
            // if there is a current uiser you can set that user as the only user that can access this object
            if (self.currentUser) {
                yourData.ACL = [PFACL ACLWithUser:self.currentUser];
            }
            
            [yourData saveInBackground];
            
        } else {
            
            
            NSLog(@"You already stored your data");
            
        }
        
    }];
     
}

@end
