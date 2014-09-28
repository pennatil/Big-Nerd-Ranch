//
//  BNRAppDelegate.m
//  iTahDoodle
//
//  Created by Lucas Pennati on 05.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRAppDelegate.h"

//Helper to retrieve the path to the data
NSString *BNRDocPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                            NSUserDomainMask,
                                                            YES);
    return [pathList[0] stringByAppendingPathComponent:@"data1.td"];
}

@implementation BNRAppDelegate

#pragma mark - Application delegate callbacks

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Load an existing datased
    NSArray *plist = [NSArray arrayWithContentsOfFile:BNRDocPath()];
    if (plist){
        //We have a dataset
        self.tasks = [plist mutableCopy];
    } else {
        //No dataset
        self.tasks = [NSMutableArray array];
    }
    
    //Create and configure the UIWindow instance
    //A GRect is a struct with an origin (x,y) and a size (width,height)
    CGRect winFrame = [[UIScreen mainScreen]bounds];
    UIWindow *theWindow = [[UIWindow alloc]initWithFrame:winFrame];
    self.window = theWindow;
    
    //Define the frame rectangles of the three UI elements
    //CGRectMake() creates a CGRect form (x,y, width, height)
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height - 100);
    CGRect fieldFrame = CGRectMake(20, 40, 230, 31);
    CGRect buttonFrame = CGRectMake(250, 40, 72, 31);
    
    //Create and configure the UITable instance
    self.taskTable = [[UITableView alloc]initWithFrame:tableFrame
                                                 style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //Make the BNRAppDelegate the table view's datasource
    self.taskTable.dataSource = self;
    
    //Tell the table view which class to instantiate whenever it need to create a new cell
    [self.taskTable registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"Cell"];
    
    //Create and configure the UITextField instance where new tasks will be entered
    self.taskField = [[UITextField alloc]initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap Insert";
    self.taskField.autocorrectionType = UITextAutocorrectionTypeNo; //ADDED BY ME: Turn off autocorrect
    
    //Create and configure the UIButton instance
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    
    //Give the button a title
    [self.insertButton setTitle:@"Insert"
                       forState:UIControlStateNormal];
    [self.insertButton addTarget:self
                          action:@selector(addTask:)
                forControlEvents:UIControlEventTouchUpInside];
    
    //Add the three UI elements to the window
    [self.window addSubview:self.taskTable];
    [self.window addSubview:self.taskField];
    [self.window addSubview:self.insertButton];
    
    //Finalize the window and put it on the screen
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    //Save our tasks array to disk
    [self.tasks writeToFile:BNRDocPath() atomically:YES];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Actions
/**
 *  Adds a task to the tasks array
 *
 *  @param sender textField
 */
- (void)addTask:(id)sender
{
    //Get the task (or content of the text field)
    NSString *text = [self.taskField text];
    
    //Quit here if the taskField is empty
    if ([text length] == 0){
        //ADDED BY ME: Show a dialog if the textField contains no text
        NSLog(@"No task entered");
        UIAlertView *alertEmpty = [[UIAlertView alloc] initWithTitle:@"No task entered"
                                                             message:@"You need to enter a task"
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
        [alertEmpty show];
        return;
    }
    
    //Add it to the working array
    [self.tasks addObject:text];
    
    //Refresh the table and reload the data
    [self.taskTable reloadData];
    
    //Clear out the textField
    [self.taskField setText:@""];
    //Dismiss the keyboard
    [self.taskField resignFirstResponder];
}

- (void)removeTask:(id)sender
{
    NSLog(@"HI");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d", indexPath.row); // you can see selected row number in your console;
}

#pragma mark - Table view management

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Number of rows = number of items in the tasks array
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //This method first check for an existing cell object that we can reuse. If there isn't one, then a new cell is created
    UITableViewCell *c = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    //We then reconfigure the cell based on the model object, in this case the tasks array
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    
    //And return it properly configured
    return c;
}





@end
