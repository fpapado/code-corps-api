defmodule CodeCorps.ModelHelpers do
  use CodeCorps.Web, :model

  import CodeCorps.Helpers.String, only: [coalesce_id_string: 1, coalesce_string: 1]

  # filters

  def id_filter(query, %{"filter" => %{"id" => id_list}}) do
    ids = id_list |> coalesce_id_string
    query |> where([object], object.id in ^ids)
  end
  def id_filter(query, _), do: query

  def newest_first_filter(query), do: query |> order_by([desc: :inserted_at])

  def number_as_id_filter(query, %{"id" => number}) do
    query |> where([object], object.number == ^number)
  end
  def number_as_id_filter(query, _), do: query

  def task_type_filter(query, %{"task_type" => task_type_list}) do
    task_types = task_type_list |> coalesce_string
    query |> where([object], object.task_type in ^task_types)
  end
  def task_type_filter(query, _), do: query

  def task_status_filter(query, %{"status" => status}) do
    query |> where([object], object.status == ^status)
  end
  def task_status_filter(query, _), do: query

  def task_filter(query, %{"task_id" => task_id}) do
    query |> where([object], object.task_id == ^task_id)
  end
  def task_filter(query, _), do: query

  def project_filter(query, %{"project_id" => project_id}) do
    query |> where([object], object.project_id == ^project_id)
  end
  def project_filter(query, _), do: query

  # end filters
end
