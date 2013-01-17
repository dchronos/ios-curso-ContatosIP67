//
//  Contato.m
//  ContatosIP67
//
//  Created by ios3144 on 16/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Contato.h"

@implementation Contato
@synthesize nome = _nome;
@synthesize telefone;
@synthesize email;
@synthesize endereco;
@synthesize site;

- (NSString *)description
{
    return [NSString stringWithFormat:@"nome: %@ telefone: %@",self.nome, self.telefone];
}

@end
