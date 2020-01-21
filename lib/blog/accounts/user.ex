defmodule Blog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true
    timestamps
  end

  @required_fields ~w(email password)

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :crypted_password])
    |> validate_required([:email, :crypted_password])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6, max: 128)
  end

end
