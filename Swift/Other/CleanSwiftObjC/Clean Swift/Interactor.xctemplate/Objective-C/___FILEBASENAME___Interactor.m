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

#import "___VARIABLE_sceneName___Interactor.h"
#import "___VARIABLE_sceneName___Worker.h"

@interface ___VARIABLE_sceneName___Interactor ()
@property (strong, nonatomic) ___VARIABLE_sceneName___Worker *worker;
@end

@implementation ___VARIABLE_sceneName___Interactor

//@synthesize name = _name;

#pragma mark Do something

- (void)doSomething:(___VARIABLE_sceneName___DoSomethingRequest *)request
{
  self.worker = [[___VARIABLE_sceneName___Worker alloc] init];
  [self.worker doSomeWork];
  
  ___VARIABLE_sceneName___DoSomethingResponse *response = [[___VARIABLE_sceneName___DoSomethingResponse alloc] init];
  [self.presenter presentSomething:response];
}

@end
