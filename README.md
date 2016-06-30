# Optionals

![Drawing](http://i.imgur.com/Cm2xYU2.jpg?1)

> Life shrinks or expands in proportion to one’s courage. -[Anais Nin](https://en.wikipedia.org/wiki/Anaïs_Nin)


## Learning Objectives

* Explain that an `Optional` either contains a value, or it doesn't.
* Explain that we know whether or not an `Optional` contains a value by checking to see if the value is not equal `!=` to `nil`.
* Set an optional variable to a valueless state by assigning it the value `nil`.
* Use an if statement to find out whether an `Optional` contains a value by comparing the `Optional` against `nil`.
* Use *optional binding* to find out whether an optional contains a value, and if so, to make that value available as a temporary constant.

## Optional Values

Pets are great, aren't they? Isn't it nice to come home and a puppy that jumps up at you, excited to see you again after a long, hard day? Or a cat that climbs on your lap and walks all over your keyboard when you're trying to study Swift programming? Isn't it great that everyone has a furry (or scaly, or feathery) friend to keep them company?

Wait. Not everyone has a pet :(. When you first meet someone, it's pretty hard to know if they have a pet, unless you ask them. Until you do, you never know when they have an animal companion or not.

Situations like an unknown pet situation come up a lot in programming, too. You've already learned that constants and variables are associated with a _value_. The problem is that sometimes you don't know what that value is, or if it even exists, when you declare a constant or variable. It's like the pet situation! You might make a new friend but not immediately know if they have a pet or not.

Imagine you're righting a program to track a new acquaintance's pet situation. You want to track your friend's pet's name in a variable called `petName`, but initially you don't even know if they _have_ a pet. What do you do?

Swift deals with this sort of situation through the use of a type called an `Optional`. An `Optional` is a way of saying, "I have a piece of data I want to keep track of, but I don't know if it even _has_ a value yet." In Swift, you'd declare an `Optional` variable like this:

```swift
var petName: String?
```

Let's break down that line of code. You've seen variable declarations (using the `var` keyword) before, so that's nothing new. But what's with that type? It looks like a `String`, but it has a question mark at the end. What's up with that?

That type is actually an _optional_ string. It means that a `String` _value_ may be present, or it may not exist. Rather than saying, "`petName` is a `String`," you're saying, "`petName` is a `String`?"

Enter that line of code into a new playground. Check out the value that the playground prints for `petName` in the right-hand sidebar. Notice anything unusual?

![petName](http://i.imgur.com/oNpWF2Z.png)

The playground tells you that the value of `petName` is `nil`. In Swift, `nil` is used to represent an unknown or non-existent value. It's a placeholder until the variable's value _is_ known. It's like when you first meet someone, and don't know if they have a pet or not. They _might_ have a pet, in which case if you talk to them for a while, you can learn its name; or they might not have a pet at all, in which case, you'll never get a name for their pet, because it doesn't exist (the name _or_ the pet)!

Try Option+clicking on `petName` in the playground. Notice that Xcode reports that the type is of `String?`—_not_ `String`. It's an optional string!

![Optional string](http://i.imgur.com/l8KXEe3.png)

Let's say you talk to your new friend a bit, and you mention that you have a puppy and he's awesome. And your friend says, "I have a turtle! His name is Scooter and he's the best!"

Now you can fill in the missing information in your program:

```swift
petName = "Scooter"
```

Put that in your playground. You'll notice that playground shows you the current value of `petName` in the sidebar. It's the string "Scooter".

![Scoot](http://i.imgur.com/yq3Cg3o.png)

So that means `petName` is now a `String`. But wait...before, you learned that variables can't just change type. How did `petName` go from being a `String?` (an optional string) to a `String` when you changed the value?

Try Option+ clicking on the `petName` in the second line of code in your program. What do you see?

![petnameType](http://i.imgur.com/Zom71gF.png)

Xcode still reports the type is a `String?` (an _optional_ string). The type didn't change at all!

You can see this more obviously by adding a `print()` statement to your playground:

```swift
print(petName)
// prints Optional("Scooter")
```

Yep, still an `Optional`.

Here's an important lesson: `Optional`s may have a value, or they may be `nil`. Regardless, they are _always_ an optional. As you learn while writing Swift code, the Swift compiler can't know before your program is run if `petName` has a value or not, just like you didn't know before you talked to your friend if they had a pet or not. Even when you found out, the _type_ of that data was still `Optional`.

## Working With Optionals

A problem remains: When you print an `Optional` variable, you get that ugly "Optional(...)" bit in your output. Wouldn't it be nice to not have that part?

When working with `Optional`s, you have to _unwrap_ them to get the actual value, just like you had to ask your friend the name of their pet; you couldn't just assume they had one. Swift provides several ways to unwrap an `Optional` to get the value inside of it.

Remember: An `Optional` value may be `nil`, though; it may not have a value at all. The reason Swift wraps unknown values in an `Optional` type is because it forces you to deal with the possibility of unknown or non-existent values. This helps makes your programs less prone to crashes when working with possibly unknown data.

To unwrap an `Optional` value, you have to first determine if a value even exists, and then get that value. Remember that an unknown value is represented by `nil`. Knowing what you know about both `Optional`s and if/else statements, how might you test an `Optional` value to see if it is `nil` or a real value?

If you said `if petName != nil`, give yourself a pat on the back, because you're right! You can check to see if a value in an `Optional` exists by testing if it is equal to `nil` or not. Try this if statement in your playground:

```swift
if petName != nil {
    print("My friend's pet is \(petName)")
} else {
    print("My friend doesn't have a pet :(")
}

// prints "My friend's pet is Optional("Scooter")"
```

Voilà! You checked to see if `petName != nil`, and since it doesn't, the first branch of your if statement was executed. Try going back and removing or commenting out the second line of your playground (`petName = "Scooter"`) and see what is printed instead.

But wait. We said that unwrapping an `Optional` wouldn't print that "Optional(...)" bit in the console, but it's still being printed! That's because you haven't actually _unwrapped_ the value yet—you've only checked to see if it's `nil` or not.

To unwrap an `Optional`, you use a Swift feature called _optional binding_. In optional binding, you check to see if a value exists (is not `nil`) _and_ set it equal to a constant. That constant is now available for use within the first branch of the if statement. More important, it is bound to the actual _value_ wrapped by the `Optional`.

Try this in your playground:

```swift
if let petName = petName {
    print("My friend's pet is \(petName)")
}

// prints "My friend's pet is Scooter"
```

What do you see in the console now?

You should see "My friend's pet is Scooter". Look—no more "Optional(...)" stuff!

Let's break down that if statement a bit. Within the condition of the if statement, you wrote `let petName = petName`. That looks like a constant definition, doesn't it? Well, it is. What that line says is this: "If `petName` has a value, unwrap it and assign it to the name `petName` within the body of this if statement." You can then use `petName` to refer to the _unwrapped_ value (but only within the if statement).

Note that you don't have to use a constant with the same name as the `Optional` value. This will work, too:

```swift
if let friendsPet = petName {
    print("My friend's pet is \(friendsPet)")
    print("petName is still an Optional! \(petName)")
}

// prints "My friend's pet is Scooter"
// prints "petName is still an Optional! Optional("Scooter")"
```

Note that when you _bind_ the unwrapped value of `petName` to a different name, `petName` will still refer to the original `Optional` value. (That's why Swift programmers will often bind the unwrapped `Optional` value to a constant of the same name, to avoid using the wrong constant or variable name in the if statement.)

Try commenting out the second line of your playground (`petName = "Scooter"`) and see what gets printed now.

Another thing to note: When unwrapping `Optional`s, you don't _need_ to have an else branch in your if statement. If the `Optional` is `nil` and you didn't write an else branch, nothing will happen. Sometimes you want to do nothing, and sometimes you want to do something different if the `Optional` is nil. Either way, Swift forces you to deal with `nil` values.

Optionals play a big part in Swift programming. They may seem a bit confusing, but using them can lead to programs with fewer errors, and as you use them more, they'll quickly become second nature to you. Values may be optional, but knowing how to handle them isn't!

<a href='https://learn.co/lessons/Optionals' data-visibility='hidden'>View this lesson on Learn.co</a>
