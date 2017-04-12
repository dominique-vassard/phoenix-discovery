defmodule HelloPhoenix.UserTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.User

  @valid_attrs %{bio: "I am a big man.", email: "some@content.fr", name: "Wyatt", number_of_pets: 5}
  @invalid_attrs %{}

  def long_string(length) do
    Enum.reduce (1..length), "", fn _, acc -> acc <> "a" end
  end

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "number_of_pets is not required" do
    changeset = User.changeset(%User{}, Map.delete(@valid_attrs, :number_of_pets))
    assert changeset.valid?
  end

  test "Bio must be at least 2 character long" do
    attrs = %{@valid_attrs | bio: "1"}
    assert {:bio, "should be at least 2 character(s)"} in errors_on(%User{}, attrs)
  end

  test "Bio must be less than 140 character long" do
    attrs = %{@valid_attrs | bio: long_string(150)}
    assert {:bio, "should be at most 140 character(s)"} in errors_on(%User{}, attrs)
  end

  test "Email must contain at least an @" do
    attrs = %{@valid_attrs | email: "testexample.com"}
    assert {:email, "has invalid format"} in errors_on(%User{}, attrs)
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
