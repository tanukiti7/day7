
defmodule Customer do
  defstruct [:keys, :vals]

  def load do
      "CUSTOMER.csv"
      |> File.stream!
      |> CSV.decode
      |> Enum.to_list
      |> Enum.map(fn x -> tuple_to_list(x) end)
  end

  def tuple_to_list(tuple_data) do
      case tuple_data do
      {:ok, result} -> result
      {:error, _result} -> []
   end
  end

   def csv_struct(head, tail) do
     %Customer{keys: head, vals: tail }
   end

   def keys_vals(struct) do
     Enum.map(struct.vals, fn val -> to_map(struct.keys, val) end )
   end


   def to_map(key, val) do
     List.zip([ key, val ])
     |> Enum.into(%{})
   end

   def insert(list) do
     struct = %Customer.Customer{}
     customers = Enum.map(list, &Map.merge(struct, &1))
    #Customer.Repo.start_link()
   Enum.each(customers, fn(customer) -> Customer.Repo.insert(customer) end)
   end

   def main do
    data_list = load()
    head = hd(data_list)
    |> List.replace_at(0, :number)
    |> List.replace_at(1, :name)
    |> List.replace_at(2, :score)
    |> List.replace_at(3, :address)
    keys_vals(csv_struct(head, tl(data_list)))
    |> insert()
    #チェック
    Customer.Customer |> Customer.Repo.all
   end
end
