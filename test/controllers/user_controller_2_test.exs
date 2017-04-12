defmodule HelloPhoenix.UserController2Test do
  use HelloPhoenix.ConnCase, async: true

  alias HelloPhoenix.{Repo, User}

  test "list/2 responds with all the users" do
    users = [User.changeset(%User{}, %{name: "John DUFF", email: "john.duff@email.com", bio: "The second"}),
             User.changeset(%User{}, %{name: "Jane SAVAGE", email: "jane.savage@email.com", bio: "The first"})]
    Enum.each users, &Repo.insert!(&1)

    response = build_conn()
    |> get(user_path(build_conn(), :list))
    |> json_response(200)

    expected = %{
      "data" => [
        %{"name" => "John DUFF", "email" => "john.duff@email.com", "bio" => "The second"},
        %{"name" =>  "Jane SAVAGE", "email" => "jane.savage@email.com", "bio" => "The first"}
      ]
    }

    assert response == expected
  end

  describe "create/2" do
    test "Creates, and responds with a newly created user if attributes are valid"
    test "Returns an error and does not create a user if attributes are invalid"
  end

  describe "show/2" do
    test "Responds with a newly created user if the user is found" do
      user = User.changeset(%User{}, %{name: "John DUFF", email: "john.duff@email.com", bio: "The second"})
      |> Repo.insert!

    response = build_conn()
    |> get(user_path(build_conn(), :get_user, user.id))
    |> json_response(200)

    expected = %{
      "data" => %{"name" => "John DUFF", "email" => "john.duff@email.com", "bio" => "The second"}
    }

    assert response == expected
    end
    test "Responds with a message indicating user not found" do
      response = build_conn
      |> get(user_path(build_conn, :show, 300))
      |> json_response(404)

      expected = %{ "error" => "User not found." }


      assert response == expected
    end
  end

  describe "update/2" do
    test "Edits, and responds with the user if attributes are valid"
    test "Returns an error and does not edit the user if attributes are invalid"
  end

  test "delete/2 and responds with :ok if the user was deleted"

end