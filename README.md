# Optionals

![Pet Turtle](http://i.imgur.com/CEI0v.gif)

## Learning Objectives - The student should be able to..

* Explain that an `optional` either contains a value, or it doesn't.
* Explain that we know whether or not an `optional` contains a value by checking to see if the value is not equal `!=` to nil.
* Set an optional variable to a valueless state by assigning it the value `nil`.
* Can use an if statement to find out whether an `optional` contains a value by comparing the `optional` against nil.
* Can use *optional binding* to find out whether an optional contains a value, and if so, to make that value available as a temporary constant.

```swift
var present: String? = "iPad Air"

if let present = present {
    print("Yay!, we have a new \(present)")
    // prints "Yay!, we have a new iPad Air"
}

if let canTypeAnythingHere = present {
    print("Yay!, we have a new \(canTypeAnythingHere)")
    // prints "Yay!, we have a new iPad Air"
}
```



## What the student can do at this point 

* Create variables and constants
* Is familiar with type annotations, type inference and string interpolation.
* Can create functions with return types.
* Is familiar with the String, Int, Double, and Bool type.
* Can perform arithmetic operations on Int and Double.
* Understands if and else clause statements.


## Outline / Notes

*  Optionals are tough for beginners. It might be one of the hardest topics for students to grasp. I think it's very important to be very clear and concise in our approach. Hit a narrative and stick with it throughout being explicit where it's appropriate. Maybe build the narrative around kittens & puppies (see the third bullet point)
* Before diving into having them see that lovely `?` representing an `optional`, I like the idea (however we can do this) to make them think about why we even need `optional`'s and if we can get them thinking along those lines.. then introducing the syntax is just then a way to show them something THEY will feel like is the solution to the problem presented to them.
* Have them type the following in a playground file. In the right pane, they should see `nil`. Explain this. We either have a pet, or we don't - in this scenario (so far) we don't have a pet (we have a valueless state for a variable).

```swift
var myPet: String?
```
* Then introduce the following: 

```swift
myPet = "Turtle 🐢"
```
* Have them option click the `myPet` variable. They will notice that the `?` is still there after `String`. Why?! They might be wondering why it's no longer `nil`, shouldn't it read as `String` and **not** `String?`.  Have them print out mYpet as follows:

```swift
print(myPet)
// prints "Optional("Turtle 🐢")"
```
* In seeing that it prints out this optional word in front of Turtle, this should solidfy that even though we set `myPet` to an actual value (one that isn't `nil`) that there is some other step we need to do here in order to correctly read this value.
* Challenge the student a little bit here. We know that the valueless state is represnted by `nil`, and we know how to use `if` statements, is there a way we can use an `if` statement to see if the value to `myPet` is `nil`?. Then show them the following:

```swift
if myPet != nil {
    print("I have a pet \(myPet)")
} else {
    print("We have no pet :(")
}

// prints "I have a pet Optional("Turtle 🐢")"
```

* Well, it's still printing that optional bit. Here is where we could introduce 




<a href='https://learn.co/lessons/Optionals' data-visibility='hidden'>View this lesson on Learn.co</a>
