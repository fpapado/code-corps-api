defmodule CodeCorps.Skill do
  use CodeCorps.Web, :model

  schema "skills" do
    field :title, :string
    field :description, :string
    field :original_row, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :original_row])
    |> validate_required(:title)
    |> unique_constraint(:title)
  end
end