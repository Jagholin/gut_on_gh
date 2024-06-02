extends GutTest

func test_this_thing():
    assert_eq(1, 10, "This should fail")

func test_this_otherthing():
    assert_eq(10, 10, "This should succeed")
