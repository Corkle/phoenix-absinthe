defmodule PhoenixAbsinthe.PostResolver do
  def all(_args, _info) do
    {:ok, PhoenixAbsinthe.Repo.all(Post)}
  end

  def find(%{id: id}, _info) do
    case PhoenixAbsinthe.Repo.get(User, id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def create(args, _info) do
    %Post{}
    |> Post.changeset(args)
    |> Blog.Repo.insert
  end
end