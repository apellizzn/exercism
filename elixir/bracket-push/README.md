# Bracket Push

Make sure the brackets and braces all match.

Ensure that all the brackets and braces are matched correctly,
and nested correctly.

## Running tests

Execute the tests with:

```bash
$ elixir bob_test.exs
```

(Replace `bob_test.exs` with the name of the test file.)


### Pending tests

In the test suites, all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by
commenting out the relevant `@tag :skip` with a `#` symbol.

For example:

```elixir
# @tag :skip
test "shouting" do
  assert Bob.hey("WATCH OUT!") == "Whoa, chill out!"
end
```

Or, you can enable all the tests by commenting out the
`ExUnit.configure` line in the test suite.

```elixir
# ExUnit.configure trace: true
```

For more detailed information about the Elixir track, please
see the [help page](http://exercism.io/languages/elixir).

## Source

Ginna Baker

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

