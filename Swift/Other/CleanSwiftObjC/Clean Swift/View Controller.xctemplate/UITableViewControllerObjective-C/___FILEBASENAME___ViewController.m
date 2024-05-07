//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

#import "___VARIABLE_sceneName___ViewController.h"

@protocol ___VARIABLE_sceneName___DataStore;

@interface ___VARIABLE_sceneName___ViewController ()
//@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@end

@implementation ___VARIABLE_sceneName___ViewController

#pragma mark Object lifecycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self setup];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    [self setup];
  }
  return self;
}

#pragma mark Setup

- (void)setup
{
  ___VARIABLE_sceneName___ViewController *viewController = self;
  ___VARIABLE_sceneName___Interactor *interactor = [[___VARIABLE_sceneName___Interactor alloc] init];
  ___VARIABLE_sceneName___Presenter *presenter = [[___VARIABLE_sceneName___Presenter alloc] init];
  ___VARIABLE_sceneName___Router *router = [[___VARIABLE_sceneName___Router alloc] init];
  viewController.interactor = interactor;
  viewController.router = router;
  interactor.presenter = presenter;
  presenter.viewController = viewController;
  router.viewController = viewController;
  router.dataStore = interactor;
}

#pragma mark Routing

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  NSString *scene = segue.identifier;
  SEL selector = NSSelectorFromString([NSString stringWithFormat:@"routeTo%@WithSegue:", scene]);
  if ([self.router respondsToSelector:selector]) {
    [self.router performSelectorOnMainThread:selector withObject:segue waitUntilDone:NO];
  }
}

#pragma mark View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self doSomething];
}

#pragma mark Do something

- (void)doSomething
{
  ___VARIABLE_sceneName___DoSomethingRequest *request = [[___VARIABLE_sceneName___DoSomethingRequest alloc] init];
  [self.interactor doSomething:request];
}

- (void)displaySomething:(___VARIABLE_sceneName___DoSomethingViewModel *)viewModel
{
  //self.nameTextField.text = viewModel.name;
}

@end
