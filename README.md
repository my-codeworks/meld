# Meld

Simple merge backend for text with a common ancestor.

This gem aims to provide a decoupled implementation of just the merging of versions. The assumption is that the versions have a common root.

It takes three instances of textblocks, BASE, THIS and OTHER and returns a hash of conflicts or a merged result.

## Examples

Lets look at some examples

### Nothing changed

Given three texts, all identical in content, returns the base's content

    base = this = other = %Q{
      Lorem ipsum
    }

    Meld.new( base: base, this: this, other: other)

    # -> { result: "Lorem ipsum" }

### THIS or OTHER added to

Given three texts, where THIS or OTHER has additional content over the other two, return the text with additional content 

    base = other = %Q{
      Lorem ipsum
    }

    this_added = other + " dolor sit amet"

    Meld.new( base: base, this: this_added, other: other)

    # -> { result: "Lorem ipsum dolor sit amet" }

### THIS and OTHER added to

Given three texts, where THIS and OTHER has additional content over base, return a new text with the additional content merged

    base = %Q[
      .red {
        color: #f00;
      }
    ]

    this = %Q[
      .red {
        color: #f00;
      }

      .blue {
        color: #00f;
      }
    ]

    this = %Q[
      .red {
        color: #f00;
      }

      .green {
        color: #0f0;
      }
    ]

    Meld.new( base: base, this: this, other: other)

    # -> { result: ".red {\n  color: #f00;\n}\n\n.blue {\n  color: #00f;\n}\n\n.green {\n  color: #0f0;\n}" }

### Conflicting changes

Given three text, where THIS and OTHER has both changed base in different ways, return a hash of all the conflicts and an empty result

    base = %Q[
      .red {
        color: #f00;
      }
    ]

    this = %Q[
      .red {
        color: #00f;
      }
    ]

    this = %Q[
      .red {
        color: #0f0;
      }
    ]

    Meld.new( base: base, this: this, other: other)

    # -> { conflict: {this: {start: [2,10], end: [2,13]}, other: {start: [2,10], end: [2,12]}}, result: "" }

## Installation

Add this line to your application's Gemfile:

    gem 'meld'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install meld

## Usage



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
