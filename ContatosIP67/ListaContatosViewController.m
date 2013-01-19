//
//  ListaContatosViewController.m
//  ContatosIP67
//
//  Created by ios3144 on 18/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"


@implementation ListaContatosViewController
@synthesize contatos = _contatos;
-(id) init
{
    self = [super init];
    if(self){
        self.navigationItem.title = @"contatos";
    }
    /*UIBarButtonSystemItemAdd eh uma constante*/
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
    target:self
    action:@selector(chamaFormulario)];
    self.navigationItem.rightBarButtonItem = btn;

    return self;
}
- (void) chamaFormulario{
    NSLog(@"chamou");
    FormularioContatoViewController *formulario = [[FormularioContatoViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:formulario];
    //[self presentModalViewController:formulario animated:YES];
    [self presentViewController:nav animated:YES completion:nil];
}



@end
