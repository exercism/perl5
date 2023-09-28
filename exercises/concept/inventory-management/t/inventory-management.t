#!/usr/bin/env perl

use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use InventoryManagement ();

subtest 'create_inventory($items)' => sub { # begin: create task: 1
    is(
        InventoryManagement::create_inventory( [ 'wood', 'iron', 'iron', 'diamond', 'diamond' ] ),
        { wood => 1, iron => 2, diamond => 2 },
        'Create an inventory',
    );

    is(
        InventoryManagement::create_inventory( [ 'iron', 'diamond', 'diamond', 'diamond', 'gold' ] ),
        { iron => 1, diamond => 3, gold => 1 },
        'Create another inventory',
    );
}; # end: create

subtest 'add_items( $inventory, $items )' => sub { # begin: add task: 2
    is(
        InventoryManagement::add_items(
            { wood => 4, iron => 2 },
            [ 'iron', 'iron' ],
        ),
        { wood => 4, iron => 4 },
        'Add one item',
    );

    is(
        InventoryManagement::add_items(
            { wood => 2, gold => 1, diamond => 3 },
            [ 'wood', 'gold', 'gold' ],
        ),
        { wood => 3, gold => 3, diamond => 3 },
        'Add multiple items'
    );

    is(
        InventoryManagement::add_items(
            { iron => 1, diamond => 2 },
            [ 'iron', 'wood', 'wood' ],
        ),
        { iron => 2, diamond => 2, wood => 2 },
        'Add new item',
    );

    is(
        InventoryManagement::add_items(
            {},
            [ 'iron', 'iron', 'diamond' ],
        ),
        { iron => 2, diamond => 1 },
        'Add to empty hash',
    );
}; # end: add

subtest 'remove_items( $inventory, $items )' => sub { # begin: remove task: 3
    is(
        InventoryManagement::remove_items(
            { iron => 3, diamond => 4, gold => 2 },
            [ 'iron', 'iron', 'diamond', 'gold', 'gold' ],
        ),
        { iron => 1, diamond => 3, gold => 0 },
        'Remove one item',
    );

    is(
        InventoryManagement::remove_items(
            { wood => 2, iron => 3, diamond => 1 },
            [ 'wood', 'wood', 'wood', 'iron', 'diamond', 'diamond' ],
        ),
        { wood => 0, iron => 2, diamond => 0 },
        'Stop removing items at zero',
    );
}; # end: remove

subtest 'delete_item( $inventory, $item )' => sub { # begin: delete task: 4
    is(
        InventoryManagement::delete_item(
            { iron => 1, diamond => 2, gold => 1 },
            'diamond',
        ),
        { iron => 1, gold => 1 },
        'Delete an item',
    );

    is(
        InventoryManagement::delete_item(
            { iron => 1, diamond => 2, gold => 1 },
            'gold',
        ),
        { iron => 1, diamond => 2 },
        'Delete another item',
    );
}; # end: delete

done_testing;
