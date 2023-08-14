package InventoryManagement;

use v5.38;

sub create_inventory ($items) {
    my %inventory;
    for ( $items->@* ) {
        $inventory{$_}++;
    }
    return \%inventory;
}

sub add_items ( $inventory, $items ) {
    for ( $items->@* ) {
        $inventory->{$_}++;
    }
    return $inventory;
}

sub remove_items ( $inventory, $items ) {
    for ( $items->@* ) {
        $inventory->{$_}-- if $inventory->{$_};
    }
    return $inventory;
}

sub delete_item ( $inventory, $item ) {
    delete $inventory->{$item};
    return $inventory;
}
