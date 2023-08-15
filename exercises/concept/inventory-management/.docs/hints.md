# Hints

## 1. Create a new inventory using the items

- You need to `return` a hash reference from the `create_inventory` subroutine, containing the items as keys, and the amount of them in the `$items` array reference as values.

## 2. Add to the inventory using the items

- You need to `return` a hash reference from the `add_items` subroutine, with the amount of items increased by how many there are contained in the `$items` array reference.

## 3. Remove the items from the inventory

- You need to `return` a hash reference from the `remove_items` subroutine, with the amount of items decreased by how many there are contained in the `$items` array reference.
- The item count must not go below `0`.

## 4. Delete the item completely from the inventory

- You need to `return` a hash reference from the `delete_item` subroutine, with the item completely removed from the inventory.
