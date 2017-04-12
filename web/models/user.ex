defmodule HelloPhoenix.User do
  use HelloPhoenix.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :number_of_pets, :integer

    has_many :videos, HelloPhoenix.Video
    timestamps()
  end

  @required_fields ~w(name email bio)
  @optional_fields ~w(number_of_pets)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    # |> cast(params, [:name, :email, :bio, :number_of_pets])
    # |> validate_required([:name, :email, :bio])
    |> validate_required(Enum.map @required_fields, &String.to_atom/1)
    |> validate_length(:bio, min: 2)
    |> validate_length(:bio, max: 140)
    |> validate_format(:email, ~r/@/)
  end
end
