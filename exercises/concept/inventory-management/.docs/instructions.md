# Instructions

You're going to write some code to manage an inventory of items in a store.
The inventory will be a hash reference containing the inventory items and their quantity.

## 1. Create a new inventory using the items

Modify the `InventoryManagement::create_inventory` subroutine, which takes an array reference of items as an argument, to return a newly created inventory hash reference, with keys being the item names and values being the quantity.

## 2. Add to the inventory using the items

Modify the `InventoryManagement::add_items` subroutine, which takes an inventory hash reference and an item array reference as arguments, to return a hash reference with the items added to the inventory.

## 3. Remove the items from the inventory

Modify the `InventoryManagement::remove_items` subroutine, which takes an inventory hash reference and an item array reference as arguments, to return a hash reference with the items removed from the inventory.
Item quantities should not go below zero.

## 4. Delete the item completely from the inventory

Modify the `InventoryManagement::delete_item` subroutine, which takes an inventory hash reference and an item name as arguments, to return a hash reference with the item deleted from the inventory completely.
