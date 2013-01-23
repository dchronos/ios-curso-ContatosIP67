//
//  FormularioContatoViewControllerDelegate.h
//  ContatosIP67
//
//  Created by ios3144 on 22/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@protocol FormularioContatoViewControllerDelegate <NSObject>

-(void)contatoAdicionado:(Contato *) contato;
-(void)contatoAlterado:(Contato *) contato;

@end
