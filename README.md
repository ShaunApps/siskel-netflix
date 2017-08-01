# Siskel

During this exercise, you will work in small groups to create _Siskel_, an object that retrieves show data using this [Netflix Roulette API](https://netflixroulette.net/api/). To do so, you've been provided with a file, `test.rb`, containing failing tests. It is your job to make as many of these tests pass in the time provided as you can. READ through this whole document before starting.

Upon completion, you should be able to use a simple API to retrieve data from the web and understand how you can use tests to dictate the design of your projects.

## Getting Started

If you have already cloned this repo, skip this step.

If you haven't already cloned this repo, each member of your team should clone this repo to their projects folder. Even though you are working together, each of you should have a copy of the answer.
```sh
cd YOUR_PROJECTS_FOLDER_GOES_HERE
git clone PUT_THIS_REPOS_GIT_CLONE_URL_HERE
```

Enter the cloned directory and use `bundler` to install all the required gems.

```sh
$ cd siskel
$ bundle
```

Run the provided tests.

```sh
$ ruby test.rb
Run options: --seed 10217

# Running:

.

Finished in 0.112265s, 8.9075 runs/s, 8.9075 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

You will notice that we have one passing test. To get you started, we have already gone ahead and written some code to make the first test pass.

This first test requires that we retrieve the movie *Fargo* using `Siskel.new("Fargo")` and assign it to a `movie` variable. Calling `movie.title` should return `"Fargo"`.

```ruby
# test.rb

class TestSiskel < Minitest::Test
  def test_movie_title
    movie = Siskel.new('Fargo')
    assert_equal 'Fargo', movie.title
  end
end
```

Our `Siskel` object uses HTTParty to access the Netflix API when it is initialized. We will explore this API in more detail shortly. Using the data returned, we can assign `@title` to return our movies's title.

```ruby
# siskel.rb

require 'httparty'

class Siskel
  attr_reader :title

  def initialize(name)
    @name = HTTParty.get("http://netflixroulette.net/api/api.php?title=#{name}")
    @title = @name['show_title']
  end
end

```

Now that our first test has passed, uncomment the next test in `test.rb`. This new test should fail when we run our tests. Write just enough code for this test to pass. Continue this process until all tests pass.

## Using the Netflix API

Retrieving a show/movie title from the Netflix Roulette Api involves appending the `name` of the show to the api endpoint string `"http://netflixroulette.net/api/api.php?title="`. But what if the name of the show and/or movie we're trying to retrieve is more than one word long? Example: `"Breaking Bad"`

Well, in this case, we can't have spaces in between the name of the movie/show we're retrieving. The API expects that we replace the spaces with `%20`, so a `GET` request with the above title would be sent as `"http://netflixroulette.net/api/api.php?title=breaking%20bad"`

Hint: there's a Ruby method for this! Check out [gsub](https://ruby-doc.org/core-2.1.4/String.html#method-i-gsub).


Now get to work!

## Additional Resources

* [HTTParty Documentation](https://github.com/jnunemaker/httparty) - HTTParty gives us a number of methods we can use to further clean up our project.

* [Bundler](http://bundler.io/) - Bundler makes managing gems and dependencies a breeze. Check out the documentation for a deeper dive into how it works.
