//
//  ListaContatosViewController.h
//  ContatosIP67
//
//  Created by ios3144 on 18/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import "FormularioContatoViewControllerDelegate.h"

@interface ListaContatosViewController : UITableViewController <FormularioContatoViewControllerDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
@property (strong) NSMutableArray *contatos;
@property NSUInteger linhaDestaque;
@property (weak) Contato *contatoSelecionado;

@property (strong) NSManagedObjectContext *contexto;

@end
