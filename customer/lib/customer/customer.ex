defmodule Customer.Customer do
  use Ecto.Schema
  schema "customers" do
    field :number, :string
    field :name, :string
    field :score, :string
    field :address, :string

  end
 end
