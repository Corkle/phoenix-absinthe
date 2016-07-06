defmodule PhoenixAbsinthe.Schema do
  use Absinthe.Schema
  import_types Blog.Schema.Types

  query do
    @desc "Get all blog posts"
    field :posts, list_of(:post) do
      resolve &PhoenixAbsinthe.PostResolver.all/2
    end

    @desc "Get a user of the blog"
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &PhoenixAbsinthe.PostResolver.find/2
    end
  end

  mutation do
    @desc "Create a post"
    field :post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :posted_at, non_null(:time)

      resolve &PhoenixAbsinthe.PostResolver.create/2
    end

    field :user, :user do
      arg :contact, non_null(:contact_input)
      arg :password, :string

      resolve &PhoenixAbsinthe.PostResolver.create/2
    end
  end
end