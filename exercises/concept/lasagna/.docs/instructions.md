# Instructions

You're going to write some code to help you cook a lasagna from your favorite cookbook.

You have five tasks, all related to cooking your recipe.

## 1. Define the expected oven time in minutes

Set the `$Lasagna::ExpectedMinutesInOven` variable with how many minutes the lasagna should be in the oven. According to the cooking book, the expected oven time in minutes is 40:

```perl
$Lasagna::ExpectedMinutesInOven
# => 40
```

## 2. Calculate the remaining oven time in minutes

Define the `Lasagna::remaining_minutes_in_oven` subroutine that takes the actual minutes the lasagna has been in the oven as an argument and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.

```perl
Lasagna::remaining_minutes_in_oven(30)
# => 10
```

## 3. Calculate the preparation time in minutes

Define the `Lasagna::preparation_time_in_minutes` subroutine that takes the number of layers you added to the lasagna as an argument and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```perl
Lasagna::preparation_time_in_minutes(2)
# => 4
```

## 4. Calculate the total working time in minutes

Define the `Lasagna::total_time_in_minutes` subroutine that takes two arguments: the first argument is the number of layers you added to the lasagna, and the second argument is the number of minutes the lasagna has been in the oven. The subroutine should return how many minutes in total you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```perl
Lasagna::total_time_in_minutes(3, 20)
# => 26
```

## 5. Create a notification that the lasagna is ready

Define the `Lasagna::oven_alarm` subroutine that does not take any arguments and returns a message indicating that the lasagna is ready to eat.

```perl
Lasagna::oven_alarm()
# => "Ding!"
```
