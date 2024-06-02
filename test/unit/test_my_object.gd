extends GutTest
var MyObject = load('res://scripts/my_object.gd')
var AnotherObject = load('res://scripts/another_object.gd')

# ...

# Given that SomeCoolObj has a _process method that increments a_number by 1
# each time _process is called, and that the number starts at 0, this test
# should pass
func test_does_something_each_loop():
  var my_obj = MyObject.new()
  add_child_autofree(my_obj)
  gut.simulate(my_obj, 20, .1)
  assert_eq(my_obj.a_number, 20, 'Since a_number is incremented in _process, it should be 20 now')

# Let us also assume that AnotherObj acts exactly the same way as
# but has SomeCoolObj but has a _physics_process method instead of
# _process.  In that case, this test will pass too since all child objects
# have the _process or _physics_process method called.
func test_does_something_each_loop2():
  var my_obj = MyObject.new()
  var other_obj = AnotherObject.new()

  add_child_autofree(my_obj)
  my_obj.add_child(other_obj)

  gut.simulate(my_obj, 20, .1)

  assert_eq(my_obj.a_number, 20, 'Since a_number is incremented in _process, \
								  it should be 20 now')
  assert_eq(other_obj.another_number, 20, 'Since other_obj is a child of my_obj \
										   and another_number is incremented in \
										   _physics_process then it should be 20 now')
