defmodule Notes.NoteView do
  use Notes.Web, :view

  def markdown_to_html(md) do
    raw Earmark.to_html(md)
  end
end
