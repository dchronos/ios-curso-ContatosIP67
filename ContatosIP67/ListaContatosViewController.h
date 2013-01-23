//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios3144 on 18/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormularioContatoViewControllerDelegate.h"

@interface ListaContatosViewController : UITableViewController <FormularioContatoViewControllerDelegate, UIActionSheetDelegate>
@property (strong) NSMutableArray *contatos;
@property NSUInteger linhaDestaque;


@end
