defmodule Notes.Note do
  use Notes.Web, :model

  schema "notes" do
    field :title, :string
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
    |> validate_length(:title, min: 3, max: 50)
    |> validate_length(:body,  min: 3, max: 50)
    |> capitalize(:title)
  end

  defp capitalize(changeset, field) do
    case get_field(changeset, field) do
      nil ->
        changeset
      string ->
        put_change(changeset, field, String.capitalize(string))
    end
  end
end
