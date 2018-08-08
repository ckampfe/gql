defmodule GqlWeb.Schema do

  use Absinthe.Schema
  alias Gql.{Item, Repo}

  @desc "An item"
  object :item do
    field :id, :id
    field :name, :string
  end

  query do
    field :items, list_of(:item) do
      resolve fn _, _context ->
        {:ok, Repo.all(Item)}
      end
    end

    field :item, :item do
      arg :id, non_null(:id)
      resolve fn %{id: id}, _context ->
        {:ok, Repo.get(Item, id)}
      end
    end
  end


  mutation do
    @desc "Create an item"
    field :create_item, type: :item do
      arg :name, non_null(:string)
      resolve fn %{name: name}, _ ->
        case Repo.insert(%Item{name: name}) do
          {:ok, s} = item ->
            item
          {:error, e} = err ->
            err
        end
      end
    end
  end
end
